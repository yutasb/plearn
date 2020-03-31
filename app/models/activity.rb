# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :plans
  belongs_to :user
end
