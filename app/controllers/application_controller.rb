# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_activity
  before_action :login_required

  private

  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_activity
    @current_activity = Activity.find_by(:id)
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
