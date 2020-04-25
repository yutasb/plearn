require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    it "リクエストが成功すること" do
      get users_new_path
      expect(response.status).to eq(200)
    end
  end
end
