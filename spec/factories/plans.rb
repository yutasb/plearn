# frozen_string_literal: true

FactoryBot.define do
  factory :plan do
    title { 'テストプラン' }
    content {'テスト用のプランです'}
    activity
    user
  end
end
