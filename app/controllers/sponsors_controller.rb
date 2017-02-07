class SponsorsController < ApplicationController
  before_filter :set_sponsor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sponsors = Sponsor.order("position").all
    respond_with(@sponsors)
  end

  def sort
    params[:sponsor].each_with_index do |id, index|
      Sponsor.update_all({:position => index+1}, {:id => id})
    end

    render :nothing => true 
  end


  def show
    respond_with(@sponsor)
  end

  def new
    @sponsor = Sponsor.new
    respond_with(@sponsor)
  end

  def edit
  end

  def create
    @sponsor = Sponsor.new(params[:sponsor])
    @sponsor.save
    respond_with(@sponsor)
  end

  def update
    @sponsor.update_attributes(params[:sponsor])
    respond_with(@sponsor)
  end

  def destroy
    @sponsor.destroy
    respond_with(@sponsor)
  end

  private
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end
end
