# frozen_string_literal: true

require 'rails_helper'

describe 'zones', type: :request do
  let(:parsed_body) { JSON.parse(response.body) }
  let(:data) { parsed_body.dig('data', 'zones') }
  let(:zone1) { create(:zone) }
  let(:zone2) { create(:zone) }
  let(:zone3) { create(:zone) }
  let!(:zones) { [zone1, zone2, zone3] }

  let(:query) do
    <<~GRAPHQL
      query {
        zones {
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

    it 'responds with zones data' do
      expect(data).to eq(
        zones.map {|z| z.attributes.slice(*%w[id name]) }
             .map {|h| h.transform_values(&:to_s)}
      )
    end
  end
end
