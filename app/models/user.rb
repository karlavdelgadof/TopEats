class User < ApplicationRecord
  belongs_to :address
  has_many :vehicles, foreign_key: 'courier_id', dependent: :destroy
  has_many :orders, foreign_key: 'courier_id', dependent: :destroy
  has_many :orders, foreign_key: 'customer_id', dependent: :destroy

  validates_presence_of :full_name, :type
  validates_length_of :full_name, maximum: 250, on: :create
  validates_format_of :phone_number, with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  message: "- Phone numbers must be in xxx-xxx-xxxx format."
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
