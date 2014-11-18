class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url
  has_one :user
end
