class ActivityOpinionsController < ApplicationController
  def new
    @activity_opinion = ActivityOpinion.new
    @@activity = Activity.find(params[:id])
    @activity = Activity.find(params[:id])

    puts @activity.name
  end

  def create
		@opinion = ActivityOpinion.new
		@opinion.activity = @@activity.id
		@opinion.opinion = params[:activity_opinion][:opinion]
		@opinion.mark = params[:activity_opinion][:mark]

		if @opinion.save
	  	redirect_to(@@activity)
		else
	  	render "new"
		end
  end
end
