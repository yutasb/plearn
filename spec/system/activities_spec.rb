# frozen_string_literal: true

require 'rails_helper'

describe 'タスク管理機能', type: :system do
  # let(定義名){定義の内容}
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:task_a) { FactoryBot.create(:activity, title: '最初のタスク', user: user_a) }

  before do
    visit login_path
    fill_in 'email', with: login_user.email
    fill_in 'password', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAが作成したカレンダーが表示される' do
    it { expect(page).to have_content '最初のタスク' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      it_behaves_like 'ユーザーAが作成したカレンダーが表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }
      it 'ユーザーAが作成したカレンダーが表示されない' do
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      before do
        visit activity_path(task_a)
      end

      it_behaves_like 'ユーザーAが作成したカレンダーが表示される'
    end
  end

  describe '新規作成機能' do
    let (:login_user) { user_a }

    before do
      visit new_activity_path
      fill_in 'activity[title]', with: task_name
      click_button 'Create Activity'
    end

    context '新規作成画面でタイトルを入力したとき' do
      let(:task_name) { '新規作成のテストを書く' }

      it '正常に登録される' do
        expect(page).to have_content '登録しました'
      end
    end

    # context '新規作成画面でタイトルを入力しなかったとき' do
    #   let(:task_name) { '' }

    #   it 'エラーとなる' do
    #     within '#error_explanation' do
    #       expect(page).to have_content "Title can't be blank"
    #     end
    #   end
    # end
  end
end
