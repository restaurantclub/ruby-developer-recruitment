# frozen_string_literal: true

module Resolvers
  class Zones < GraphQL::Schema::Resolver
    description 'List of zones'

    type ::Models::ZoneType, null: false

    def resolve(**_kwargs)
      Zone.all
    end
  end
end
