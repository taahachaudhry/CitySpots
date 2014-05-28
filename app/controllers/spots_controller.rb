class SpotsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

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

  def edit
    @spot = Spot.find(params[:id])

    if @spot.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @spot.update_attributes(spot_params)
    redirect_to root_path
  end

  def destroy
    @spot = Spot.find(params[:id])
    if @spot.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @spot.destroy
    redirect_to root_path
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :address)
  end
end
