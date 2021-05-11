class MenuItemsController < ApplicationController
  before_filter :set_menu_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menu_items = MenuItem.order("position").all
    respond_with(@menu_items)
  end

  def sort
    params[:menu_item].each_with_index do |id, index|
      MenuItem.update_all({:position => index+1}, {:id => id})
    end

    render :nothing => true 
  end

  def show
    respond_with(@menu_item)
  end

  def new
    @menu_item = MenuItem.new
    respond_with(@menu_item)
  end

  def edit
  end

  def create
    @menu_item = MenuItem.new(params[:menu_item])
    @menu_item.save
    respond_with(@menu_item)
  end

  def update
    @menu_item.update_attributes(params[:menu_item])
    respond_with(@menu_item)
  end

  def destroy
    @menu_item.destroy
    respond_with(@menu_item)
  end

  private
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end
end
