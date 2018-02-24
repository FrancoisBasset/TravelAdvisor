class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurantOpinions = RestaurantOpinion.count
  end
end
