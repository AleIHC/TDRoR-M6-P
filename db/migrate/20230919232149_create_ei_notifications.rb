class CreateEiNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :ei_notifications do |t|
      t.text :message
      t.integer :admin_user
      t.references :ei_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
