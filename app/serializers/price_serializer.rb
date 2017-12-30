class PriceSerializer < ActiveModel::Serializer
  attributes :id, :currency, :value
end
