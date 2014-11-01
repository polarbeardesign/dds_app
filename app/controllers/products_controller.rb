class ProductsController < ApplicationController

skip_before_filter :check_authorization, :check_authentication, :only => :px

  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def px
    @products = Product.available
     @events = Event.published.ordered.tease
    
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
    @sizes = Size.by_size.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @sizes = Size.by_size.all
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    checked_sizes = []
    checked_params = params[:size_list] || []
    for check_box_id in checked_params
      size = Size.find(check_box_id)
      if not @product.sizes.include?(size)
        @product.sizes << size
      end
      checked_sizes << size
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
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
    @sizes = Size.find(:all)

        checked_sizes = []
        checked_params = params[:size_list] || []
        for check_box_id in checked_params
          size = Size.find(check_box_id)
          if not @product.sizes.include?(size)
            @product.sizes << size
          end
          checked_sizes << size
        end
        missing_sizes = @sizes - checked_sizes
        for size in missing_sizes
          if @product.sizes.include?(size)
            @product.sizes.delete(size)
          end
        end

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
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
