
require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = FactoryBot.create(:user)
    end
      it "名前、メールアドレス、パスワード必須" do
        user = @user
        expect(user).to be_valid 
      end
    
      
       it '名前は必須' do
        user = FactoryBot.build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
       end

       
        it '重複したメールアドレスは無効' do
            user = @user
            user = FactoryBot.build(:user, name: 'test2')
            user.valid?
            expect(user.errors[:email]).to include("has already been taken")
        end

        it 'パスワードは6文字以上' do
            user = FactoryBot.build(:user, password: 'test')
            user.valid?
            expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
        end
end