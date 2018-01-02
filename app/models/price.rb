class Price < ApplicationRecord
  belongs_to :product
  validates :currency, :value, presence: true
  validates :value, numericality: true
end
