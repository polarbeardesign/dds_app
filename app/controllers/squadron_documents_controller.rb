class SquadronDocumentsController < ApplicationController
  # GET /squadron_documents
  # GET /squadron_documents.json
  def index
    @squadron_documents = SquadronDocument.category_ordered.ordered.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @squadron_documents }
    end
  end

  # GET /squadron_documents/1
  # GET /squadron_documents/1.json
  def show
    @squadron_document = SquadronDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @squadron_document }
    end
  end

  # GET /squadron_documents/new
  # GET /squadron_documents/new.json
  def new
    @squadron_document = SquadronDocument.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @squadron_document }
    end
  end

  # GET /squadron_documents/1/edit
  def edit
    @squadron_document = SquadronDocument.find(params[:id])
  end

  # POST /squadron_documents
  # POST /squadron_documents.json
  def create
    @squadron_document = SquadronDocument.new(params[:squadron_document])

    respond_to do |format|
      if @squadron_document.save
        format.html { redirect_to @squadron_document, :notice => 'Squadron document was successfully created.' }
        format.json { render :json => @squadron_document, :status => :created, :location => @squadron_document }
      else
        format.html { render :action => "new" }
        format.json { render :json => @squadron_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /squadron_documents/1
  # PUT /squadron_documents/1.json
  def update
    @squadron_document = SquadronDocument.find(params[:id])

    respond_to do |format|
      if @squadron_document.update_attributes(params[:squadron_document])
        format.html { redirect_to @squadron_document, :notice => 'Squadron document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @squadron_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /squadron_documents/1
  # DELETE /squadron_documents/1.json
  def destroy
    @squadron_document = SquadronDocument.find(params[:id])
    @squadron_document.destroy

    respond_to do |format|
      format.html { redirect_to squadron_documents_url }
      format.json { head :ok }
    end
  end
end
