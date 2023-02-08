module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :addresses, [AddressType], null: false, description: 'Get all addresses'

    def addresses
      Address.all
    end
  end
end
