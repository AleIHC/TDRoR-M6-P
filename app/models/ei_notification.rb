class EiNotification < ApplicationRecord

  belongs_to :ei_admin, foreign_key: "admin_user", class_name: "EiUser"

  belongs_to :ei_user, optional: true
end
