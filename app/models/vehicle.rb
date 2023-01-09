class Vehicle < ApplicationRecord
  belongs_to :courier, class_name: 'User'
  enum vehicle_type: {
    "🚗" => 0,
    "🚲" => 1,
    "🛵" => 2
  }
end
