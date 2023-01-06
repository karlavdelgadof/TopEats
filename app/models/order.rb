class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :courier, class_name: 'User'
  has_many :order_items
  has_many :menu_items, through: :order_items
end
