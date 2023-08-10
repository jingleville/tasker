class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.text :title
      t.text :body
      t.references :procedure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
