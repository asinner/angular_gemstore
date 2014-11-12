class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :shine,
             :rarity, :price, :color, :faces, :category_id

  # embed :ids
  has_many :images, :reviews
end
