require 'rails_helper'


def activities
   
end

RSpec.describe "Activities", type: :request do
  describe "/activities/new" do
    it 'Activityの新規登録画面が表示されること（リクエストが成功すること）' do
      get new_activity_path
      expect(response).to have_http_status(200)
    end
    
  end
end
