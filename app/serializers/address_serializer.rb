class AddressSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_many :couriers
  has_many :customers
end
