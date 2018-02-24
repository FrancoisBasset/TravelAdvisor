class RestaurantOpinionsController < ApplicationController
  def show
    @restaurantOpinions = RestaurantOpinion.all
  end
end
