class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new strong_params
    @restaurant.save ? redirect_to(@restaurant) : render(:new)
  end

  def destroy
  end

  private

  def strong_params
    params.require(:restaurant).permit(Restaurant::STRONG_PARAMS)
  end
end
