class ActivitiesController < ApplicationController

  # def index
  #   @activities = Activity.all

  #   if params[:query].present?
  #     @activities = @activities.search_by_name_and_description(params[:query])
  #   end

  #   if params[:setting].present?
  #     @activities = @activities.where(setting: params[:setting])
  #   end
  # end

  def index
    @activities = Activity.all
    @settings = Activity.distinct.pluck(:setting)
    @age_ranges = Activity::AGE_RANGES.keys

    if params[:query] || params[:setting] || params[:minimum_age]
      @activities = Activity.search_with_filters(@activities, {query: params[:query], setting: params[:setting], minimum_age: params[:minimum_age]})
      end
    end



    # if params[:query].present?
    #   @activities = @activities.search_by_name_and_description(params[:query])
    # end

    # if params[:setting].present?
    #   @activities = @activities.where(setting: params[:setting])
    # end
    # @activities = @activities.where(minimum_age: params[:minimum_age]) if params[:minimum_age].present?

    respond_to do |format|
      format.html
      format.turbo_stream
    end


  def show
    @activity = Activity.find(params[:id])
  end

  # def create
  #   raise
  # end

  def set_to_favorite
    @activity = Activity.find(params[:id])
    @activity.favorite = true
    @activity.save
    redirect_to activities_path

    if @activity.favorite.user == true
    end
  end

end
