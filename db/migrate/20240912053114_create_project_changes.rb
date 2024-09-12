class CreateProjectChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :project_changes do |t|
      t.string :field_name
      t.string :value
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
