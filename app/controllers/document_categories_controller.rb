class DocumentCategoriesController < ApplicationController
  # GET /document_categories
  # GET /document_categories.json
  def index
    @document_categories = DocumentCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @document_categories }
    end
  end

  # GET /document_categories/1
  # GET /document_categories/1.json
  def show
    @document_category = DocumentCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @document_category }
    end
  end

  # GET /document_categories/new
  # GET /document_categories/new.json
  def new
    @document_category = DocumentCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @document_category }
    end
  end

  # GET /document_categories/1/edit
  def edit
    @document_category = DocumentCategory.find(params[:id])
  end

  # POST /document_categories
  # POST /document_categories.json
  def create
    @document_category = DocumentCategory.new(params[:document_category])

    respond_to do |format|
      if @document_category.save
        format.html { redirect_to @document_category, :notice => 'Document category was successfully created.' }
        format.json { render :json => @document_category, :status => :created, :location => @document_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @document_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /document_categories/1
  # PUT /document_categories/1.json
  def update
    @document_category = DocumentCategory.find(params[:id])

    respond_to do |format|
      if @document_category.update_attributes(params[:document_category])
        format.html { redirect_to @document_category, :notice => 'Document category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @document_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /document_categories/1
  # DELETE /document_categories/1.json
  def destroy
    @document_category = DocumentCategory.find(params[:id])
    @document_category.destroy

    respond_to do |format|
      format.html { redirect_to document_categories_url }
      format.json { head :ok }
    end
  end
end
