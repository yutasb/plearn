# frozen_string_literal: true

class AddActivityIdToPlan < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM activities;'
    add_reference :plans, :activity, index: true
  end

  def down
    remove_reference :plans, :activity, index: true
  end
end
