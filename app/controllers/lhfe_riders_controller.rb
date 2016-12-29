class LhfeRidersController < ApplicationController
  before_filter :set_lhfe_rider, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @lhfe_riders = LhfeRider.ordered.all
    respond_with(@lhfe_riders)
  end

  def show
    respond_with(@lhfe_rider)
  end

  def new
    @lhfe_rider = LhfeRider.new
    respond_with(@lhfe_rider)
  end

  def edit
  end

  def create
    @lhfe_rider = LhfeRider.new(params[:lhfe_rider])
    @lhfe_rider.save
    respond_with(@lhfe_rider)
  end

  def update
    @lhfe_rider.update_attributes(params[:lhfe_rider])
    respond_with(@lhfe_rider)
  end

  def destroy
    @lhfe_rider.destroy
    respond_with(@lhfe_rider)
  end

  private
    def set_lhfe_rider
      @lhfe_rider = LhfeRider.find(params[:id])
    end
end
