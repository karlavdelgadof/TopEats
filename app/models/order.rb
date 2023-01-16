class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :courier, class_name: 'User'
  has_many :order_items
  has_many :menu_items, through: :order_items

  enum status: {
    pending: 0,
    accepted: 1,
    preparing: 2,
    delivered: 3
  }

  validates_numericality_of :total_price, greater_than_or_equal_to: 0

  scope :five_most_recent_delivered_orders, -> (courier) { where("courier_id = ?", courier.id).where(status: :delivered).last(5) }
end
