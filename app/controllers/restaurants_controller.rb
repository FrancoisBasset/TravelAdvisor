class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurantOpinions = RestaurantOpinion.where(restaurant: @restaurant.id)
  end

  def new
    @restaurant = Restaurant.new
    @@city = City.find(params[:id])
    @city = City.find(params[:id])
  end

  def create
		@restaurant = Restaurant.new
		@restaurant.city = @@city.id
		@restaurant.name = params[:restaurant][:name]
		@restaurant.address = params[:restaurant][:address]
    @restaurant.rank = params[:restaurant][:rank]

    uploaded_io = params[:restaurant][:image]
	  File.open(Rails.root.join('app', 'assets', 'images', 'restaurants', @restaurant.name + ".jpg"), 'wb') do |file|
	    file.write(uploaded_io.read)
		end

		if @restaurant.save
	  	redirect_to(@@city)
		else
	  	render "new"
		end
  end
end
