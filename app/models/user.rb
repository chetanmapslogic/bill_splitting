class User < ActiveRecord::Base
  validates_presence_of :username
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
