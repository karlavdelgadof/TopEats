class Courier < User
  belongs_to :address
  has_many :orders, dependent: :destroy
  has_many :vehicles, dependent: :destroy
end
