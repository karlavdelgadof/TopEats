class MenuItem < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  validates_presence_of :name
  validates_length_of :name, maximum: 250
end
