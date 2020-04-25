# frozen_string_literal: true

FactoryBot.define do
  factory :activity1, class: Activity do
    title { 'テストタイトル' }
    user # このuserは、userという名前のfactoryをActivityモデルに定義されたuserという名前の関連を生成するのに利用するために記述する。
  end

  factory :activity2, class: Activity do
    title { 'テストタイトル2' }
    user
  end
end
