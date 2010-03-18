require 'test_helper'

class SalesOrdersControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @sales_orders = Factory.build(:sales_order, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should_assign_to :sales_orders, :class => Array
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end  

    context "GET to :show" do
  
      setup do
        get :show, :id => @sales_orders.id
      end
  
      should_assign_to :sales_order, :class => SalesOrder
      should_respond_with :success
      should_render_template :show
      should_not_set_the_flash
    end 
  
    context "GET to :new" do
      setup do
        get :new
      end
  
      should_assign_to :sales_order, :class => SalesOrder
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end   
  
  #   context "POST to :create with valid data" do  
  #     setup do
  #       post :create, :sales_orders => {:name => 'test2'}
  #     end
  # 
  #     should_assign_to :sales_orders, :class => Certifier 
  #     should_respond_with :redirect
  #     should_redirect_to("index page"){sales_orderss_path}
  #     should_set_the_flash_to /successfully created/
  #   end
  # 
  #   context "GET to :edit" do
  #     setup do
  #       get :edit, :id => @sales_orders.id
  #     end
  # 
  #     should_assign_to(:sales_orders){@sales_orders}
  #     should_respond_with :success
  #     should_render_template :edit
  #     should_not_set_the_flash
  # 
  #   end
  # 
  #   context "PUT to :update with valid data" do
  #     setup do
  #       put :update, :id => @sales_orders.id, :sales_orders => {}
  #     end
  # 
  #     should_assign_to(:sales_orders){@sales_orders}
  #     should_respond_with :redirect
  #     should_redirect_to("index page"){sales_orderss_path}
  #     should_set_the_flash_to /successfully updated/
  #   end   
   end    
end