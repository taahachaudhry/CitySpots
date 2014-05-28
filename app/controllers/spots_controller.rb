class SpotsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    current_user.spots.create(spot_params)
    redirect_to root_path
  end

  def show
    @spot = Spot.find(params[:id])
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :address)
  end
end
