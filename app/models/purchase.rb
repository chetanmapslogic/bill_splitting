class Purchase < ActiveRecord::Base
	validates_presence_of :date_purchased, :cost, :location
	has_many :expenses, :class_name => 'Expense'
  has_many :users, :through => :expenses
  has_many :debts
  belongs_to :event
end
