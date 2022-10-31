class ParcelSerializer < ActiveModel::Serializer
  attributes :id,:recipient_name,:recipient_address,:recipient_contact,:weight,:from,:destination,:total_cost,:order_status,:user_id
end
