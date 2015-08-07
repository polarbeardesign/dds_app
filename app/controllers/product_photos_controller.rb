class ProductPhotosController < ApplicationController
  # GET /product_photos
  # GET /product_photos.json
  def index
    @product_photos = ProductPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @product_photos }
    end
  end

  # GET /product_photos/1
  # GET /product_photos/1.json
  def show
    @product_photo = ProductPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product_photo }
    end
  end

  # GET /product_photos/new
  # GET /product_photos/new.json
  def new
    @product_photo = ProductPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product_photo }
    end
  end

  # GET /product_photos/1/edit
  def edit
    @product_photo = ProductPhoto.find(params[:id])
  end

  # POST /product_photos
  # POST /product_photos.json
  def create
    @product_photo = ProductPhoto.new(params[:product_photo])

    respond_to do |format|
      if @product_photo.save
        format.html { redirect_to @product_photo, :notice => 'Product photo was successfully created.' }
        format.json { render :json => @product_photo, :status => :created, :location => @product_photo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_photos/1
  # PUT /product_photos/1.json
  def update
    @product_photo = ProductPhoto.find(params[:id])

    respond_to do |format|
      if @product_photo.update_attributes(params[:product_photo])
        format.html { redirect_to @product_photo, :notice => 'Product photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_photos/1
  # DELETE /product_photos/1.json
  def destroy
    @product_photo = ProductPhoto.find(params[:id])
    @product_photo.destroy

    respond_to do |format|
      format.html { redirect_to product_photos_url }
      format.json { head :ok }
    end
  end
end
