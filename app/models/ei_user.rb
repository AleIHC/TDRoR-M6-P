class EiUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_one :ei_profile
  has_many :ei_jobs
  has_many :ei_applications

  enum :role, [:ei_normal_user, :ei_admin]

  def role?(role_name)
    self.role == role_name
  end
  
end
