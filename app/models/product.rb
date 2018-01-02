class Product < ApplicationRecord
  belongs_to :user
  has_many :prices
  validates :name, :size, presence: true
end
