class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
