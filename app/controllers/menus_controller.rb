class MenusController < ApplicationController
  before_filter :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menus = Menu.all
    respond_with(@menus)
  end

  def show
    respond_with(@menu)
  end

  def new
    @menu = Menu.new
    respond_with(@menu)
  end

  def edit
  end

  def create
    @menu = Menu.new(params[:menu])
    @menu.save
    respond_with(@menu)
  end

  def update
    @menu.update_attributes(params[:menu])
    respond_with(@menu)
  end

  def destroy
    @menu.destroy
    respond_with(@menu)
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end
end
