# frozen_string_literal: true

module AuthenticationHelper
  def login(user)
    @user = user
    @auth_token = @user.create_new_auth_token
  end

  def logout
    @user = nil
    @auth_token = nil
  end
end
