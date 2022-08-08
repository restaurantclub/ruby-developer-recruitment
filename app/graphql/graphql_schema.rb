class GraphqlSchema < GraphQL::Schema
  mutation MutationType
  query QueryType

  max_depth 30
  default_max_page_size 400
end
