require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "/login" do
    it "ログイン画面が表示されること" do
      get login_path
      expect(response).to have_http_status(200)
    end

    it "ログインに成功すること" do
      @user = FactoryBot.create(:user)
      post login_path, params: {email:"test1@example.com",password:"password"}
      expect(response).to redirect_to activities_path
    end

    it "アカウント登録していないユーザーはログインできないこと" do
      @user = FactoryBot.create(:user)
      post login_path, params: {email:"noaccount@example.com",password: "password"}
      expect(response.body).to include 'メールアドレスかパスワードが正しくありません'
    end
    
  end
end
