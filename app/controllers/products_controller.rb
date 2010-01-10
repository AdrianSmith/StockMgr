class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    @product_types = ProductType.find(:all).map{|t| [t.name.titleize, t.id]}
    @suppliers = Supplier.find(:all).map{|t| [t.name.titleize, t.id]}
    @units_of_measure = UnitsOfMeasure.find(:all, :order => 'id').map{|t| [t.name, t.id]}
    @storage_types = StorageType.find(:all).map{|t| [t.name.titleize, t.id]}
    @storage_locations = StorageLocation.find(:all).map{|t| [t.name.titleize, t.id]}
    @physical_forms = PhysicalForm.find(:all).map{|t| [t.name.titleize, t.id]}
    @certifiers = Certifier.find(:all).map{|t| [t.name.titleize, t.id]}    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])

    @product_types = ProductType.find(:all).map{|t| [t.name.titleize, t.id]}
    @suppliers = Supplier.find(:all).map{|t| [t.name.titleize, t.id]}
    @units_of_measure = UnitsOfMeasure.find(:all, :order => 'id').map{|t| [t.name, t.id]}
    @storage_types = StorageType.find(:all).map{|t| [t.name.titleize, t.id]}
    @storage_locations = StorageLocation.find(:all).map{|t| [t.name.titleize, t.id]}
    @physical_forms = PhysicalForm.find(:all).map{|t| [t.name.titleize, t.id]}    
    @certifiers = Certifier.find(:all).map{|t| [t.name.titleize, t.id]}    
    
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    @product_types = ProductType.find(:all).map{|t| [t.name.titleize, t.id]}
    @suppliers = Supplier.find(:all).map{|t| [t.name.titleize, t.id]}
    @units_of_measure = UnitsOfMeasure.find(:all, :order => 'id').map{|t| [t.name, t.id]}
    @storage_types = StorageType.find(:all).map{|t| [t.name.titleize, t.id]}
    @storage_locations = StorageLocation.find(:all).map{|t| [t.name.titleize, t.id]}
    @physical_forms = PhysicalForm.find(:all).map{|t| [t.name.titleize, t.id]}    
    @certifiers = Certifier.find(:all).map{|t| [t.name.titleize, t.id]}    

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    @product_types = ProductType.find(:all).map{|t| [t.name.titleize, t.id]}
    @suppliers = Supplier.find(:all).map{|t| [t.name.titleize, t.id]}
    @units_of_measure = UnitsOfMeasure.find(:all, :order => 'id').map{|t| [t.name, t.id]}
    @storage_types = StorageType.find(:all).map{|t| [t.name.titleize, t.id]}
    @storage_locations = StorageLocation.find(:all).map{|t| [t.name.titleize, t.id]}
    @physical_forms = PhysicalForm.find(:all).map{|t| [t.name.titleize, t.id]}    
    @certifiers = Certifier.find(:all).map{|t| [t.name.titleize, t.id]}    

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
