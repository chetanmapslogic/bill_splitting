class Purchase < ActiveRecord::Base
	validates_presence_of :date_purchased, :cost, :location
	validates :cost, :numericality => { :greater_than_or_equal_to => 1 }
	has_many :expenses, :class_name => 'Expense'
  has_many :users, :through => :expenses
  has_many :debts
  belongs_to :event
end
