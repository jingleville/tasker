class Addstagetoprojects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :stage_id, :integer
  end
end
