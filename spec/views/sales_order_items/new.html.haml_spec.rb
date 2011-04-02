require 'spec_helper'

describe "sales_order_items/new.html.haml" do
  before(:each) do
    assign(:sales_order_item, stub_model(SalesOrderItem,
      :sales_order_id => 1,
      :product_id => 1,
      :quantity => "9.99",
      :custom_price => "9.99",
      :use_custom_price => false
    ).as_new_record)
  end

  it "renders new sales_order_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_order_items_path, :method => "post" do
      assert_select "input#sales_order_item_sales_order_id", :name => "sales_order_item[sales_order_id]"
      assert_select "input#sales_order_item_product_id", :name => "sales_order_item[product_id]"
      assert_select "input#sales_order_item_quantity", :name => "sales_order_item[quantity]"
      assert_select "input#sales_order_item_custom_price", :name => "sales_order_item[custom_price]"
      assert_select "input#sales_order_item_use_custom_price", :name => "sales_order_item[use_custom_price]"
    end
  end
end
