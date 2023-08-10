class AddOrderToProjectStages < ActiveRecord::Migration[7.0]
  def change
    add_column :stages, :order, :integer
  end
end 
