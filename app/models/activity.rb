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

  

  validates :title, presence: true
end
