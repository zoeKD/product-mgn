class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attributes do |t|
      t.string :product_attribute

      t.timestamps
    end
  end
end
