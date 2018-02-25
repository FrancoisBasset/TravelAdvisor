class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @hotelOpinions = HotelOpinion.where(hotel: @hotel.id)
  end

  def new
    @hotel = Hotel.new
    @@city = City.find(params[:id])
    @city = City.find(params[:id])
  end

  def create
		@hotel = Hotel.new
		@hotel.city = @@city.id
		@hotel.name = params[:hotel][:name]
		@hotel.address = params[:hotel][:address]
    @hotel.rank = params[:hotel][:rank]

    uploaded_io = params[:hotel][:image]
	  File.open(Rails.root.join('app', 'assets', 'images', 'hotels', @hotel.name + ".jpg"), 'wb') do |file|
	    file.write(uploaded_io.read)
		end

		if @hotel.save
	  	redirect_to(@@city)
		else
	  	render "new"
		end
  end
end
