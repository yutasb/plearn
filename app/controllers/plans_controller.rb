# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.create(plan_parameter)
    @plan.save
    redirect_to plans_path, notice: '登録しました'
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plan_path, notice: '削除しました'
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_parameter)
      redirect_to plans_path, notice: '更新しました'
    else
      render 'edit'
    end
  end

  private

  def plan_parameter
    params.require(:plan).permit(:title, :content, :start_time)
  end
end
