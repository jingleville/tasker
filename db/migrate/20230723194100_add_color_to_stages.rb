class AddColorToStages < ActiveRecord::Migration[7.0]
  def change
    add_column :stages, :color, :string, defult: 'grey'
  end
end
