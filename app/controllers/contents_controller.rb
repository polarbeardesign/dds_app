class ContentsController < ApplicationController
  before_filter :set_content, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contents = Content.all
    respond_with(@contents)
  end

  def show
    respond_with(@content)
  end

  def new
    @content = Content.new
    respond_with(@content)
  end

  def edit
  end

  def create
    @content = Content.new(params[:content])
    @content.save
    respond_with(@content)
  end

  def update
    @content.update_attributes(params[:content])
    respond_with(@content)
  end

  def destroy
    @content.destroy
    respond_with(@content)
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end
end
