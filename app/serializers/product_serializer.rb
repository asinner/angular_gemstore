class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :shine, 
    :rarity, :price, :color, :faces
end
