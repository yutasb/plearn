# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Activities', type: :request do
  include LoginSupport

  before do
    @user = FactoryBot.create(:user)
    @activity1 = FactoryBot.create(:activity1)
    @activity2 = FactoryBot.create(:activity2)
  end

  describe 'activities #new' do
    it 'Activityの新規登録画面が表示されること' do
      user = @user
      sign_ine(user)
      get new_activity_path
      expect(response.status).to eq(200)
    end
  end

  #   describe "activities #create" do
  #     it 'Activityの新規登録が完了すること' do
  #       post activities_path
  #       expect(response.status).to eq(200)
  #     end
  #   end

  # describe "activities #index" do
  #   it 'Activityの一覧画面が表示されること' do
  #     user = @user
  #     activity = @activity1
  #     id = activity.id
  #     get activities_path
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "activities #show" do
  #   it 'Activityの詳細画面（カレンダー画面）が表示されること' do
  #     activity = @activity1
  #     get activity_path activity.id
  #     expect(response).to eq(200)
  #   end
  # end

  describe 'activities #edit' do
    it 'Actvivityの編集画面が表示されること' do
      activity = @activity1
      get edit_activity_path activity.id
      expect(response.status).to eq(200)
    end

    it 'Activityのタイトルが表示されていること' do
      activity = @activity1
      get edit_activity_path activity.id
      expect(response.body).to include 'テストタイトル'
    end
  end

  # describe "activities #update" do
  ###############################
  # #urlが/activities.idという形になっており、methodがpostになっている。なぞ。
  #################################

  # it 'リクエストが成功すること' do
  #   activity = @activity
  #   put activity_path activity.id , params: {activity: FactoryBot.attributes_for(:activity)}
  #   expect(response).to eq 302
  # end

  # it "Activityのタイトルが更新されていること" do end

  # end

  describe 'activities #destroy' do
    it 'リクエストが成功すること' do
      activity = @activity1
      delete activity_path activity.id
      expect(response).to redirect_to activities_path
    end

    it '削除されていること' do
      expect do
        activity = @activity1
        delete activity_path activity.id
      end.to change(Activity, :count).by(-1)
    end
  end
end
