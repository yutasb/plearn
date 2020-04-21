# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to activities_path, notice: 'ログインしました'
    else
      flash.now[:alert] = 'メールアドレスかパスワードが正しくありません'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
