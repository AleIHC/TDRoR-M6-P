class CreateEiJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :ei_jobs do |t|
      t.references :ei_user, null: false, foreign_key: true
      t.string :position
      t.text :job_description
      t.decimal :salary
      t.date :deadline

      t.timestamps
    end
  end
end
