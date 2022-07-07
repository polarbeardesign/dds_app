class LhfeRidersController < ApplicationController
  before_filter :set_lhfe_rider, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @lhfe_riders = LhfeRider.reverse_chron.all

    @events = LhfeRider.reverse_chron.select('DISTINCT event_id, ride_date')

    @males = LhfeRider.male
    @females = LhfeRider.female
    @age_brackets = LhfeRider.find_by_sql("SELECT SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 10 AND (TIMESTAMPDIFF(year,dob,ride_date) < 20), 1, 0)) AS `a`, SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 20 AND (TIMESTAMPDIFF(year,dob,ride_date) < 30), 1, 0)) AS `b`, SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 30 AND (TIMESTAMPDIFF(year,dob,ride_date) < 40), 1, 0)) AS `c`, SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 40 AND (TIMESTAMPDIFF(year,dob,ride_date) < 50), 1, 0)) AS `d`, SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 50 AND (TIMESTAMPDIFF(year,dob,ride_date) < 60), 1, 0)) AS `e`, SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 60 AND (TIMESTAMPDIFF(year,dob,ride_date) < 70), 1, 0)) AS `f`, SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 70 AND (TIMESTAMPDIFF(year,dob,ride_date) < 80), 1, 0)) AS `g`, SUM(IF(TIMESTAMPDIFF(year,dob,ride_date) >= 80, 1, 0)) AS `h` FROM lhfe_riders")
    @demo_ages = LhfeRider.find_by_sql("SELECT MAX(TIMESTAMPDIFF(year,dob,ride_date)) AS 'max_age', MIN(TIMESTAMPDIFF(year,dob,ride_date)) AS 'min_age', SUM(IF(dob IS NOT NULL,1,0)) AS 'qty' FROM lhfe_riders LIMIT 1")
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
