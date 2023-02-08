# frozen_string_literal: true

module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: false
  end
end
