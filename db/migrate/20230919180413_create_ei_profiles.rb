class CreateEiProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :ei_profiles do |t|
      t.references :ei_user, null: false, foreign_key: true
      t.string :profile_picture
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :current_position
      t.date :work_start_date

      t.timestamps
    end
  end
end
