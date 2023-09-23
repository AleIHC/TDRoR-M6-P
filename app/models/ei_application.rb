class EiApplication < ApplicationRecord
  belongs_to :ei_user
  belongs_to :ei_job
end
