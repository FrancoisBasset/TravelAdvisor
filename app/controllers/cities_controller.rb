class CitiesController < ApplicationController

	before_action :set_cities, only: [:show, :edit, :destroy, :update]

  def show
		@cities = City.all
  end

  def new
    @city = City.new
  end

  def create
		@city = City.new(
	  	params.require(:city).permit(
			:name, :description, :rank))

		if @city.save
	  	redirect_to(@city)
		else
	  	render "new"
		end
  end

  def edit;  end

  def update
		if @city.update(
			params.require(:city).permit(
				:name, :description, :rank))

			redirect_to(@city)
		else
			render 'edit'
		end
  end

  def destroy
		@city.destroy
		redirect_to(cities_path)
  end

  private

  def set_cities
		@city = City.find(params[:id])
  end
end
