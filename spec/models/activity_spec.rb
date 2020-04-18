
require 'rails_helper'



RSpec.describe Activity, type: :model do
    before do
        @user = FactoryBot.create(:user)
    end

   it 'タイトルは必須' do
    activity = Activity.new(title: nil)
    activity.valid?
    expect(activity.errors[:title]).to include("can't be blank")
   end

#    #検索文字列に一致するActivityを返す
#     it 'returns activities that match the search term' do
#         user = User.create(
#             name: 'test',
#             email: 'test@example.com',
#             password: 'password'
#         )
#         activities = user.activities.create(
#             title: 'test activity'
#         )

#         search = activities.search(test)
#         expect(Activity.search('test')). include(search)
#     end

   it 'ユーザー単位では重複したActivityのタイトルは許可しない' do
    user = @user
    user.activities.create(
        title:'test title'
    )
    new_activity = user.activities.create(
        title: 'test title'
    )

    new_activity.valid?
    expect(new_activity.errors[:title]).to include("has already been taken")
   end

   it '2人のユーザーが同じタイトルのActivityを使うことは許可する' do
    user = @user
    user.activities.create(
        title: 'test'
    )
    user2 = User.create(
        name:'test',
        email:'aaa@example.com',
        password:'password'
    )
    user2.activities.create(
        title: 'test'
    )
    expect(user2).to be_valid
   end

end