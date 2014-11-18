class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :action
      t.belongs_to :user, index: true
      t.belongs_to :trackable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
