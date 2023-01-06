class Vehicle < ApplicationRecord
  belongs_to :courier, class_name: 'User'
end
