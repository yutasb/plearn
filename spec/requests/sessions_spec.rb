require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "session #create" do
    it "リクエストが成功すること" do
      get login_path
      # expect(response).to have_http_status(200)
      assert_response :success
    end

    it "アカウント登録しているユーザーはログインに成功すること" do
      @user = FactoryBot.create(:user)
      post login_path, params: {email:"test1@example.com",password:"password"}
      expect(response).to redirect_to activities_path
    end

    it "アカウント登録のないユーザーはログインできず、エラーが表示されること" do
      @user = FactoryBot.create(:user)
      post login_path, params: {email:"noaccount@example.com",password: "password"}
      expect(response.body).to include 'メールアドレスかパスワードが正しくありません'
    end


  end
end
