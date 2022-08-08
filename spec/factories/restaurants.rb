# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    name { Faker::Fantasy::Tolkien.character }
    lat { Faker::Number.between(from: 52.0, to: 52.9).round(4) }
    lng { Faker::Number.between(from: 21.0, to: 21.9).round(4) }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    zone
  end
end
