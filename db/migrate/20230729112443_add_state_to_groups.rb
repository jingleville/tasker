class AddStateToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :archived, :boolean, defult: false
  end
end
