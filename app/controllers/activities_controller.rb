# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @activities = Activity.where(user_id: current_user.id)
  end

  def show
    @plans = current_user.plans.where(activity_id: params[:id])
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to activities_path, notice: '登録しました'
    else
      render :new
    end
  end

  def edit; end

  private

  def activity_params
    params.require(:activity).permit(:title)
  end
end
