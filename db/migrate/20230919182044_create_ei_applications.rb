class CreateEiApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :ei_applications do |t|
      t.references :ei_user, null: false, foreign_key: true
      t.references :ei_job, null: false, foreign_key: true
      t.text :application_message

      t.timestamps
    end
  end
end
