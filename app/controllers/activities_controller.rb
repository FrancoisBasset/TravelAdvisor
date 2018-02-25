class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @activityOpinions = ActivityOpinion.where(activity: @activity.id)
  end

  def new
    @activity = Activity.new
    @@city = City.find(params[:id])
    @city = City.find(params[:id])
  end

  def create
		@activity = Activity.new
		@activity.city = @@city.id
		@activity.name = params[:activity][:name]
		@activity.address = params[:activity][:address]
    @activity.rank = params[:activity][:rank]

    uploaded_io = params[:activity][:image]
	  File.open(Rails.root.join('app', 'assets', 'images', 'activities', @activity.name + ".jpg"), 'wb') do |file|
	    file.write(uploaded_io.read)
		end

		if @activity.save
	  	redirect_to(@@city)
		else
	  	render "new"
		end
  end
end
