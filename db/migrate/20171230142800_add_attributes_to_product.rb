class AddAttributesToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_attributes, :string
  end
end
