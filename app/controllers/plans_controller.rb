# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = current_user.plans
  end

  def new
    @plan = Plan.new
  end

  def show
    @plan = current_user.plans.find(params[:id])
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to plans_path, notice: '登録しました'
    else
      render :new
    end
  end

  def destroy
    @plan = current_user.plans.find(params[:id])
    @plan.destroy
    redirect_to plans_path, notice: '削除しました'
  end

  def edit
    @plan = current_user.plans.find(params[:id])
  end

  def update
    @plan = current_user.plans.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plans_path, notice: '更新しました'
    else
      render 'edit'
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :content, :start_time)
  end
end
