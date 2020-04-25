# frozen_string_literal: true

module LoginSupport
  def sign_in_as(user)
    visit root_path
    click_link 'ログイン'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'ログインする'
  end

  def sign_in(user)
    cookies[:auth_token] = user.auth_token
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
