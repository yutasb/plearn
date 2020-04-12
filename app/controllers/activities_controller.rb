# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @activities = Activity.where(user_id: current_user.id).search(params[:search])
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
      flash.now[:alert] = 'タイトルを入力してください'
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = current_user.activities.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activities_path(@activity), notice: '更新しました'
    else
      flash.now[:alert] = 'タイトルを入力してください'
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path, notice: '削除しました'
  end

  private

  def activity_params
    params.require(:activity).permit(:title)
  end
end
