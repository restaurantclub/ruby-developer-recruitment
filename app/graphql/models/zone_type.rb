# frozen_string_literal: true

module Models
  class ZoneType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :restaurants, [Models::ZoneType], null: false
  end
end

