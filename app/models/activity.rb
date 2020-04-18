# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: :user_id}

  has_many :plans
  belongs_to :user

  default_scope -> { order(updated_at: :desc) }

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

  
end
