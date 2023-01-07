class Customer < User
  has_many :orders, dependent: :destroy
end
