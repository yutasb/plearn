# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :plans
  belongs_to :user

  validates :title, presence: true
end
