class Price < ApplicationRecord
  belongs_to :product
  validates :currency, :value, presence: true
  validates :value, numericality: true

  include ActiveModel::Serializers::JSON

  def attributes
    {'id': nil,
      'currency': nil,
      'value': nil,
    }
  end
end
