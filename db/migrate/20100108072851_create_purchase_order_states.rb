class CreatePurchaseOrderStates < ActiveRecord::Migration
  def self.up
    create_table :purchase_order_states do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_order_states
  end
end
