class CitiesController < ApplicationController

	before_action :set_cities, only: [:show, :edit, :destroy, :update]

  def show
		@country = Country.find(@city.country)
  end

  def new
		@country = Country.find(params[:format])
    @city = City.new
  end

  def create
		@city = City.new(
	  	params.require(:city).permit(
			:name, 49, :description, :rank))

		uploaded_io = params[:city][:image]
	  File.open(Rails.root.join('app', 'assets', 'images', 'cities', @city.name + ".jpg"), 'wb') do |file|
	    file.write(uploaded_io.read)
		end

		if @city.save
			puts "OK"
	  	redirect_to(@city)
		else
	  	render "new"
		end
  end

  def edit;  end

  def update
		if @city.update(
			params.require(:city).permit(
				:name, 49, :description, :rank))

			redirect_to(@city)
		else
			render 'edit'
		end
  end

  def destroy
		File.delete("app/assets/images/cities/" + @city.name + ".jpg")
		@city.destroy
		redirect_to(cities_path)
  end

  private

  def set_cities
		@city = City.find(params[:id])
  end
end
