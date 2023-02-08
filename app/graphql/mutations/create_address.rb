module Mutations
  class CreateAddress < BaseMutation
    # arguments passed to the `resolve` method
    argument :description, String, required: true

    # return type from the mutation
    type Types::AddressType

    def resolve(description: nil)
      Address.create!(
        description: description,
      )
    end
  end
end
