class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @activityOpinions = ActivityOpinion.where(activity: @activity.id)
  end
end
