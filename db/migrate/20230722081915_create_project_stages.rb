class CreateProjectStages < ActiveRecord::Migration[7.0]
  def change
    create_table :project_stages do |t|
      t.references :project, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
