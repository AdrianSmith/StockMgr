require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @product = Factory.build(:product, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should_assign_to :products, :class => Array
      should_respond_with :success
    end

    context "GET to :show" do

      setup do
        get :show, :id => @product.id
      end

      should_assign_to :product, :class => Product
      should_respond_with :success
    end

    context "GET to :new" do
      setup do
        get :new
      end

      should_assign_to :product, :class => Product
      should_respond_with :success
    end

    context "POST to :create with valid data" do
      setup do
        post :create, :product => {:name => 'test2',
                                   :product_type => ProductType.new,
                                   :supplier => Supplier.new,
                                   :certifier => Certifier.new,
                                   :units_of_measure => UnitsOfMeasure.new,
                                   :minimum_quantity => 1,
                                   :storage_type => StorageType.new,
                                   :storage_location => StorageLocation.new}
      end

      should_assign_to :product, :class => Product
      should_respond_with :redirect
      should_redirect_to("index page"){products_path}
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @product.id
      end

      should_assign_to(:product){@product}
      should_respond_with :success
      should_render_template :edit
    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @product.id, :product => {}
      end

      should_assign_to(:product){@product}
      should_respond_with :redirect
      should_redirect_to("index page"){products_path}
    end
  end
end
