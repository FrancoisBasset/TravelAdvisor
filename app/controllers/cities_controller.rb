class CitiesController < ApplicationController
	before_action :set_country, only: [:new]
	before_action :set_city, only: [:show, :edit, :destroy, :update]

  def show
		@@country = Country.find(@city.country)
		@country = Country.find(@city.country)
		@restaurants = Restaurant.where(city: @city.id)
		@hotels = Hotel.where(city: @city.id)
		@activities = Activity.where(city: @city.id)
  end

  def new
    @city = City.new
  end

  def create
		@city = City.new
		@city.name = params[:city][:name]
		@city.description = params[:city][:description]
		@city.rank = params[:city][:rank]
		@city.country = @@country.id

		uploaded_io = params[:city][:image]
	  File.open(Rails.root.join('app', 'assets', 'images', 'cities', @city.name + ".jpg"), 'wb') do |file|
	    file.write(uploaded_io.read)
		end

		if @city.save
	  	redirect_to(@city)
		else
	  	render "new"
		end
  end

  def edit;  end

  def update
		@cityname = @city.name

		if @city.update(
			params.require(:city).permit(
				:name, :country ,:description, :rank))

			if params[:city][:image]
				uploaded_io = params[:city][:image]
		  	File.open(Rails.root.join('app', 'assets', 'images', 'cities', @city.name + ".jpg"), 'wb') do |file|
		    	file.write(uploaded_io.read)
				end
			end

			if @cityname != @city.name
				@beginning = "app/assets/images/cities/"
				File.rename(@beginning + @cityname + ".jpg", @beginning + @city.name + ".jpg")
			end

			redirect_to(@city)
		else
			render 'edit'
		end
  end

  def destroy
		File.delete("app/assets/images/cities/" + @city.name + ".jpg")
		@city.destroy
		redirect_to(countries_path)
  end

  private

	def set_country
		@@country = Country.find(params[:id])
		@country = Country.find(params[:id])
	end

  def set_city
		@city = City.find(params[:id])
  end
end
