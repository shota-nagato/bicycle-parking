class BicycleParking < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
  validates :opening_hours, presence: true
  validates :bicycle_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :motorized_bicycle_under_50cc_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :motorized_bicycle_under_125cc_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bicycle_and_motorized_bicycle_under_50cc_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :motorcycle_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :motorcycle_price, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
