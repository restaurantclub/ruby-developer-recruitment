class QueryType < BaseObject
  field :zone, Models::ZoneType do
    argument :id, ID, required: true
  end

  field :restaurant, Models::RestaurantType do
    argument :id, ID, required: true
  end

  field :zones, [Models::ZoneType],
                resolver: Resolvers::Zones

  field :restaurants, [Models::RestaurantType],
                      resolver: Resolvers::Restaurants

  def zone(id:)
    Zone.find(id)
  end

  def restaurant(id:)
    Restaurant.find(id)
  end
end
