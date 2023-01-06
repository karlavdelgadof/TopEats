class Vehicle < ApplicationRecord
  belongs_to :courier, class_name: 'User'
  enum type: {
    "🚗" => 0,
    "🚲" => 1,
    "🛵" => 2
  }
end
