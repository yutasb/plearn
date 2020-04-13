# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :plans
  belongs_to :user

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def done_plan(plan)
    plans.find_by(done_flg: true)
  end

  validates :title, presence: true
end
