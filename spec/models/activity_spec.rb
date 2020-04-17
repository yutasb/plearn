
require 'rails_helper'

RSpec.describe Activity, type: :model do
  #タイトルがなければ無効
   it 'is invalid without title' do
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
end