class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  include PublicActivity::Model
  tracked owner: :user
end
