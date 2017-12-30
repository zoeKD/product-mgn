class Product < ApplicationRecord
  belongs_to :user
  has_many :prices
  validates :name, :size, presence: true
  accepts_nested_attributes_for :prices

  include ActiveModel::Serializers::JSON

  def attributes
    {'id': nil,
      'name': nil,
      'size': nil
    }
  end

  def getJson
    self.as_json(include: { "prices" => nil})
  end
end
