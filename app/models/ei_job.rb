class EiJob < ApplicationRecord
  belongs_to :ei_user

  has_many :ei_applications
end
