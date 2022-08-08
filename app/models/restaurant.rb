class Restaurant < ApplicationRecord
  belongs_to :zone

  validates :name, :address, :lat, :lng, presence: true
end
