class EiProfile < ApplicationRecord
  belongs_to :ei_user

  has_one_attached :profile_picture
end
