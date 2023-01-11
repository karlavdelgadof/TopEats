class CourierSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :phone_number
  belongs_to :address
  has_many :vehicles
  has_many :orders
end
