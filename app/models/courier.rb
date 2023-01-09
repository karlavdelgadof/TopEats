class Courier < User
  has_many :orders, dependent: :destroy
  has_many :vehicles, dependent: :destroy
end
