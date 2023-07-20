class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :author
      t.text :title
      t.text :body
      t.datetime :deadline
      t.text :status
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
