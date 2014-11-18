class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates_presence_of :password

  has_many :recipes
  has_many :friendships
  has_many :friends, through: :friendships

end
