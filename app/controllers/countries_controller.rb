class CountriesController < ApplicationController
	before_action :all_countries, only: [:index, :deletecountry]
	before_action :set_country, only: [:show, :edit, :destroy, :update, :deletecity, :modifycity]
	before_action :set_cities, only: [:show, :destroy, :deletecity, :modifycity]

  def show; end

  def new
    @country = Country.new
  end

	def deletecountry;	end

	def deletecity; end

  def create
		@country = Country.new(
	  	params.require(:country).permit(:name, :description, :touristsCount)
		)

		uploaded_io = params[:country][:image]
	  File.open(Rails.root.join('app', 'assets', 'images', 'countries', @country.name + ".jpg"), 'wb') do |file|
	    file.write(uploaded_io.read)
		end

		if @country.save
	  	redirect_to(countries_path)
		else
	  	render "new"
		end
  end

  def edit; end

  def update
		if @country.update(params.require(:country).permit(:name, :description, :touristsCount))
			if params[:country][:image]
				uploaded_io = params[:country][:image]
		  	File.open(Rails.root.join('app', 'assets', 'images', 'countries', @country.name + ".jpg"), 'wb') do |file|
		    	file.write(uploaded_io.read)
				end
			end

			redirect_to(@country)
		else
	  	render 'edit'
		end
  end

  def destroy
		@cities.each do |city|
			File.delete("app/assets/images/cities/" + city.name + ".jpg")
			city.destroy
		end

		@country.destroy
		File.delete("app/assets/images/countries/" + @country.name + ".jpg")

		if Country.count == 0
			redirect_to(countries_path)
		else
			redirect_to(deletecountry_countries_path)
		end
  end

  private

	def all_countries
		@countries = Country.order('name')
	end

  def set_country
		@country = Country.find(params[:id])
  end

	def set_cities
		@cities = City.where(country: @country.id)
	end

end
