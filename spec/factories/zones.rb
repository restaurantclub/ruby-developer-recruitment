# frozen_string_literal: true

FactoryBot.define do
  factory :zone do
    name { Faker::Address.state }
  end
end
