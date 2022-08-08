# frozen_string_literal: true

require 'rails_helper'

describe 'restaurants', type: :request do
  let(:parsed_body) { JSON.parse(response.body) }
  let(:data) { parsed_body.dig('data', 'restaurants') }
  let(:restaurant1) { create(:restaurant) }
  let(:restaurant2) { create(:restaurant) }
  let(:restaurant3) { create(:restaurant) }
  let!(:restaurants) { [restaurant1, restaurant2, restaurant3] }

  let(:query) do
    <<~GRAPHQL
      query {
        restaurants {
          id
          name
        }
      }
    GRAPHQL
  end

  context 'without any params' do
    before do
      post('/graphql', params: { query: query })
    end

    it 'responds with restaurants data' do
      expect(data).to eq(
        restaurants.map {|z| z.attributes.slice(*%w[id name]) }
                   .map {|h| h.transform_values(&:to_s)}
      )
    end
  end
end
