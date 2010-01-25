# == Schema Information
#
# Table name: sales_order_items
#
#  id                  :integer(4)      not null, primary key
#  sales_order_id      :integer(4)
#  product_id          :integer(4)
#  quantity            :integer(10)
#  percentage_discount :integer(4)
#  price               :decimal(8, 2)   default(0.0)
#  created_at          :datetime
#  updated_at          :datetime
#

class SalesOrderItem < ActiveRecord::Base
  belongs_to :sales_order
  belongs_to :product
  
  validates_presence_of :sales_order, :product 
  
  def cost
    product.cost * quantity
  end
  
  def price
    product.price * quantity
  end
    
end



