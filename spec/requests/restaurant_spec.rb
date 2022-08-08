# frozen_string_literal: true

require 'rails_helper'

describe 'restaurant', type: :request do
  let(:parsed_body) { JSON.parse(response.body) }
  let(:data) { parsed_body.dig('data', 'restaurant') }
  let!(:restaurant) { create(:restaurant) }

  let(:query) do
    <<~GRAPHQL
      query {
        restaurant(id: #{restaurant.id}) {
          id
          name
          lat
          lng
          address
        }
      }
    GRAPHQL
  end

  context 'with proper id' do
    before do
      post('/graphql', params: { query: query })
    end

    it 'responds with restaurant data' do
      expect(data['id'].to_i).to eq(restaurant.id)
      expect(data['name']).to eq(restaurant.name)
      expect(data['lat']).to eq(restaurant.lat)
      expect(data['lng']).to eq(restaurant.lng)
      expect(data['address']).to eq(restaurant.address)
    end
  end
end
