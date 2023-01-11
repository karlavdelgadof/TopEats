class Address < ApplicationRecord
  validates_presence_of :description
  validates_length_of :description, maximum: 500

  has_many :customers
  has_many :couriers
end
