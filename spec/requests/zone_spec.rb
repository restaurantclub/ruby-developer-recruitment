# frozen_string_literal: true

require 'rails_helper'

describe 'zone', type: :request do
  let(:parsed_body) { JSON.parse(response.body) }
  let(:data) { parsed_body.dig('data', 'zone') }
  let!(:zone) { create(:zone) }

  let(:query) do
    <<~GRAPHQL
      query {
        zone(id: #{zone.id}) {
          id
          name
        }
      }
    GRAPHQL
  end

  context 'with proper id' do
    before do
      post('/graphql', params: { query: query })
    end

    it 'responds with zone data' do
      expect(data['id'].to_i).to eq(zone.id)
      expect(data['name']).to eq(zone.name)
    end
  end
end
