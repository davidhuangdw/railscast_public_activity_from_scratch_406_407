class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  belongs_to :comment, ->{includes(:activities).references(:activities)}, foreign_key: :trackable_id
  belongs_to :recipe,->{includes(:activities).references(:activities)}, foreign_key: :trackable_id
end
