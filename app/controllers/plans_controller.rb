# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = current_user.plans
    @activity = Activity.find(params[:activity_id])
  end

  def show
    @plan = current_user.plans.find(params[:id])
    @activity = Activity.find(params[:activity_id])
  end

  def new
    @plan = Plan.new
    @plans = current_user.id
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to activity_path(@activity), notice: '登録しました'
    else
      flash.now[:alert] = 'タイトルと内容を入力してください'
      render :new
    end
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @plan = current_user.plans.find(params[:id])
    @plan.destroy
    redirect_to activity_path(@activity), notice: '削除しました'
  end

  def edit
    @plan = current_user.plans.find(params[:id])
  end

  def update
    @plan = current_user.plans.find(params[:id])
    @activity = Activity.find(params[:activity_id])
    if @plan.update!(plan_params)
      redirect_to activity_plan_path(@activity), notice: '更新しました'
    else
      render 'edit'
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :content, :start_time, :activity_id,:done_flg)
  end
end

