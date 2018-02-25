class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurantOpinions = RestaurantOpinion.where(restaurant: @restaurant.id)
  end
end
