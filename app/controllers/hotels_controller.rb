class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @hotelOpinions = HotelOpinion.where(hotel: @hotel.id)
  end
end
