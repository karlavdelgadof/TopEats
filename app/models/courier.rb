class Courier < User
  has_many :orders, dependent: :destroy
end
