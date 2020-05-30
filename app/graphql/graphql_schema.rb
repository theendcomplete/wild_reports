class GraphqlSchema < GraphQL::Schema
  max_depth 4

  query(Types::QueryType)
  mutation(Types::MutationType)
end
