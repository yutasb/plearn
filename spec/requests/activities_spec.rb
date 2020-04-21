require 'rails_helper'

RSpec.describe "Activities", type: :request do
  before do
        @user = FactoryBot.create(:user)
      end
  describe "GET /activities" do
    it 'activity一覧画面の表示に成功すること' do
      user = @user
      get activities_path
      expect(response).to have_http_status(200)
    end
  end
  # describe "POST /activities" do
  #   context "as an authenticated user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #     end
  #     context "with valid attributes" do
  #       it 'adds a activity' do
  #         expect{
  #           post activities_path
  #         }.to change(@user.activities, :count).by(1)
  #       end      
  #     end
  #   end
  # end
end
