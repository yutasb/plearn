# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
