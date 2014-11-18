class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  validates_presence_of :content

  include PublicActivity::Model
  tracked owner: :user
end
