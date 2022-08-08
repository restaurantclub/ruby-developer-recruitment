Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute", as: :graph_api
end
