class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :total_price
  belongs_to :courier
  belongs_to :customer
end
