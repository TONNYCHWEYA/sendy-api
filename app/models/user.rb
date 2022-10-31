class User < ApplicationRecord
  has_secure_password
  has_many :parcels, dependent: :destroy
  validates :first_name, :last_name, :email_address, :phone_number, :username, :password_digest, presence: true
end
