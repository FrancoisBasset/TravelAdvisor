class HotelOpinionsController < ApplicationController
  def new
    @hotel_opinion = HotelOpinion.new
    @@hotel = Hotel.find(params[:id])
    @hotel = Hotel.find(params[:id])
  end

  def create
		@opinion = HotelOpinion.new
		@opinion.hotel = @@hotel.id
		@opinion.opinion = params[:hotel_opinion][:opinion]
		@opinion.mark = params[:hotel_opinion][:mark]

		if @opinion.save
	  	redirect_to(@@hotel)
		else
	  	render "new"
		end
  end
end
