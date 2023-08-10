class AddPositionToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :position, :integer
    add_index :projects, [:position, :procedure_id], unique: :true
  end
end
