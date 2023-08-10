class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :stages, :order, :stage_ord
  end
end
