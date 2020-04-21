require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /sessions" do
    it "ログインに成功すること" do
      @user = FactoryBot.create(:user)
      post login_path
      expect(response).to redirect_to login_path
    end
  end
end
