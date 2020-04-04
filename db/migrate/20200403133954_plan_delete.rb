# frozen_string_literal: true

class PlanDelete < ActiveRecord::Migration[6.0]
  def change
    execute 'DELETE FROM plans;'
    execute 'DELETE FROM activities;'
  end
end
