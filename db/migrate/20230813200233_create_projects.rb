class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.text :title
      t.integer :position
      t.references :procedure, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
