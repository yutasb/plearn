# frozen_string_literal: true

class AddUserIdToPlan < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM plans;'
    add_reference :plans, :user, index: true
  end

  def down
    remove_reference :plans, :users, index: true
  end
end
