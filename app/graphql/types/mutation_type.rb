module Types
  class MutationType < Types::BaseObject
    field :create_address, mutation: Mutations::CreateLink, description: 'Creates a new address'
  end
end
