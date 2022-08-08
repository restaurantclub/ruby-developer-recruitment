# frozen_string_literal: true

module Resolvers
  class Restaurants < GraphQL::Schema::Resolver
    description 'List of restaurants'

    type ::Models::RestaurantType, null: false

    def resolve(**_kwargs)
      Restaurant.all
    end
  end
end
