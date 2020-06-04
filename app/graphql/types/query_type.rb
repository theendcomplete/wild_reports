module Types
  class QueryType < BaseObject
    field :me, resolver: Resolvers::Me

    field :organizations, [Types::OrganizationType], null: true
    def organizations
      # context[:current_user]&.organizations
      Organization.includes([:items]).all
    end
  end
end
