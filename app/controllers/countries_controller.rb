class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
	cid = @country.id
	@cities = City.where('country = :cid')
  end

  def new
    @country = Country.new
  end

  def create
	@country = Country.new(
	  params.require(:country).permit(
		:name, :description))

	if @country.save
	  redirect_to(@country)
	else
	  render "new"
	end
  end

  def edit
	@country = Country.find(params[:id])
  end

  def update
	@country = Country.find(params[:id])
	if @country.update(
	  params.require(:country).permit(
		:name, :description))
	  redirect_to(@country)
	else
	  render 'edit'
	end
  end

  def destroy
	@country = Country.find(params[:id])
	@country.destroy
	redirect_to(countries_path)
  end
end
