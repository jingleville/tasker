class ReplaceUselessColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :procedures, :body
    remove_column :stages, :body
  end
end
