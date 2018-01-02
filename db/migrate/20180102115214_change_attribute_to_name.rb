class ChangeAttributeToName < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_attributes, :product_attribute
    add_column :product_attributes, :name, :string
  end
end
