class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :size, :prices
  has_many :prices
end
