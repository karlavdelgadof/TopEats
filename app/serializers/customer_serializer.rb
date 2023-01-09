class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :phone_number
  belongs_to :address
end
