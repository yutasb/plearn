class AddColumnDoneflgToPlan < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :done_flg, :boolean, default: false, null: false
  end
end
