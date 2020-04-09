# frozen_string_literal: true

class Plan < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  belongs_to :activity
end
