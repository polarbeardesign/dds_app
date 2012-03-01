class GalleryCategoriesController < ApplicationController
  # GET /gallery_categories
  # GET /gallery_categories.xml
  def index
    @gallery_categories = GalleryCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gallery_categories }
    end
  end

  # GET /gallery_categories/1
  # GET /gallery_categories/1.xml
  def show
    @gallery_category = GalleryCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery_category }
    end
  end

  # GET /gallery_categories/new
  # GET /gallery_categories/new.xml
  def new
    @gallery_category = GalleryCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery_category }
    end
  end

  # GET /gallery_categories/1/edit
  def edit
    @gallery_category = GalleryCategory.find(params[:id])
  end

  # POST /gallery_categories
  # POST /gallery_categories.xml
  def create
    @gallery_category = GalleryCategory.new(params[:gallery_category])

    respond_to do |format|
      if @gallery_category.save
        format.html { redirect_to(@gallery_category, :notice => 'Gallery category was successfully created.') }
        format.xml  { render :xml => @gallery_category, :status => :created, :location => @gallery_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gallery_categories/1
  # PUT /gallery_categories/1.xml
  def update
    @gallery_category = GalleryCategory.find(params[:id])

    respond_to do |format|
      if @gallery_category.update_attributes(params[:gallery_category])
        format.html { redirect_to(@gallery_category, :notice => 'Gallery category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_categories/1
  # DELETE /gallery_categories/1.xml
  def destroy
    @gallery_category = GalleryCategory.find(params[:id])
    @gallery_category.destroy

    respond_to do |format|
      format.html { redirect_to(gallery_categories_url) }
      format.xml  { head :ok }
    end
  end
end
