class Activity < PublicActivity::Activity
  # belongs_to :comment, foreign_key: :trackable_id
  # belongs_to :recipe, foreign_key: :trackable_id
  belongs_to :comment, ->{includes(:activities).references(:activities)}, foreign_key: :trackable_id
  belongs_to :recipe,->{includes(:activities).references(:activities)}, foreign_key: :trackable_id
end