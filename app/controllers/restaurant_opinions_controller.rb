class RestaurantOpinionsController < ApplicationController
  def new
    @restaurant_opinion = RestaurantOpinion.new
    @@restaurant = Restaurant.find(params[:id])
    @restaurant = Restaurant.find(params[:id])
  end

  def create
		@opinion = RestaurantOpinion.new
		@opinion.restaurant = @@restaurant.id
		@opinion.opinion = params[:restaurant_opinion][:opinion]
		@opinion.mark = params[:restaurant_opinion][:mark]

		if @opinion.save
	  	redirect_to(@@restaurant)
		else
	  	render "new"
		end
  end
end
