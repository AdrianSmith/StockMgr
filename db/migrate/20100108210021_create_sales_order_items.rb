class CreateSalesOrderItems < ActiveRecord::Migration
  def self.up
    create_table :sales_order_items do |t|
      t.integer :product_id
      t.decimal :quantity
      t.integer :percentage_discount
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :sales_order_items
  end
end
