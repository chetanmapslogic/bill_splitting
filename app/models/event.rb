class Event < ActiveRecord::Base
	has_many :purchases
  validates :name, uniqueness: true, presence: true
end
