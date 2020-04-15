# frozen_string_literal: true

class Plan < ApplicationRecord
  validates :title, presence: true


  belongs_to :user
  belongs_to :activity


  def done_plan(plan)
    Plan.find_by(id: plan.id , done_flg: true)
  end
end
