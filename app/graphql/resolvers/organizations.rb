# class Resolvers::Organizations < GraphQL::Schema::Resolver
#   type [Types::OrganizationType], null: true
#   description "Returns the current user's organizations"
#
#   def resolve
#     context[:current_user]&.organizations
#   end
# end
