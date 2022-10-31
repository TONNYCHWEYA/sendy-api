class Parcel < ApplicationRecord
  belongs_to :user, optional: true
  validates :recipient_name, :recipient_address, :recipient_contact, :weight, :from, :destination, presence: true
  validates_inclusion_of :order_status, in: %w[delivered processed in-transit]
end
