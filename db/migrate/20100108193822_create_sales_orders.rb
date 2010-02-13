class CreateSalesOrders < ActiveRecord::Migration
  def self.up
    create_table :sales_orders do |t|
      t.integer :user_id
      t.text :comment
      t.integer :created_by_user_id
      t.boolean :is_ordered, :default => false
      t.boolean :is_invoiced, :default => false
      t.boolean :is_paid, :default => false
      t.decimal :invoice_amount, :precision => 8, :scale => 2, :default => 0.0
      t.timestamp :invoiced_at

      t.timestamps
    end
  end

  def self.down
    drop_table :sales_orders
  end
end
