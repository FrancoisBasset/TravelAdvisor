class CountriesController < ApplicationController

	before_action :set_countries, only: [:show, :edit, :destroy, :update]

  def index
    @countries = Country.order('name')
  end

  def show
		@cities = City.all
  end

  def new
    @country = Country.new
  end

  def create
		puts params

		@country = Country.new(
	  	params.require(:country).permit(
			:name, :description, :touristsCount))

		uploaded_io = params[:country][:image]
	  File.open(Rails.root.join('app', 'assets', 'images', 'countries', @country.name + ".jpg"), 'wb') do |file|
	    file.write(uploaded_io.read)
		end

		if @country.save
	  	redirect_to(@country)
		else
	  	render "new"
		end
  end

  def edit;  end

  def update
		if @country.update(
	  	params.require(:country).permit(
				:name, :description, :touristsCount))
	  	redirect_to(@country)
		else
	  	render 'edit'
		end
  end

  def destroy
		@country.destroy
		redirect_to(countries_path)
  end

  private

  def set_countries
		@country = Country.find(params[:id])
		puts params
  end
end
