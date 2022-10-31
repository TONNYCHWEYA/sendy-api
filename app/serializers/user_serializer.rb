class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,:phone_number,:username,:password_digest,:email_address,:isAdmin 
  has_many :parcels
end
