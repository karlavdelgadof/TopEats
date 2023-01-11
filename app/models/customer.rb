class Customer < User
  belongs_to :address
  has_many :orders, dependent: :destroy
end
