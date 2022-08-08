# frozen_string_literal: true

module Models
  class RestaurantType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: true
    field :city, String, null: true
    field :lat, Float, null: true
    field :lng, Float, null: true
  end
end
