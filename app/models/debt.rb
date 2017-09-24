class Debt < ActiveRecord::Base
	belongs_to :creditor, :class_name => "User", :foreign_key => "creditor_id"
	belongs_to :debtor, :class_name => "User", :foreign_key => "debtor_id"
	belongs_to :purchase
	
	def self.calculate_debths(splitter_ids,purchase_id)
		purchase = Purchase.find_by_id(purchase_id)
		splitter_ids = splitter_ids << purchase.user_id.to_s
		percentage = 1.0 / (splitter_ids.length.to_f - 1)
		debt_cost = purchase.cost * percentage

		splitter_ids.reject(&:empty?).each do |splitter_id|
			if splitter_id != purchase.user_id
				purchase.debts.build(:cost => debt_cost, :creditor_id => purchase.user_id, :debtor_id => splitter_id)
				purchase.save
			end
			expense = Expense.new(:user_id => purchase.user_id, :purchase_id => purchase_id, :percentage => percentage)
			expense.save
		end
	end

	def self.debt_owed(user)
		owed = Hash.new
		credits = self.where(creditor: user)
		credits.each do |credit|
			if owed.has_key?(credit.debtor.username)
        owed[credit.debtor.username] += credit.cost
      else
        owed[credit.debtor.username] = credit.cost
      end
		end
		
		debts = self.where(debtor: user)
	  debts.each do |debt|
			if owed.has_key?(debt.creditor.username)
        owed[debt.creditor.username] -= debt.cost
      else 
        owed[debt.creditor.username] = -debt.cost
      end
		end
		return owed
	end
end
