class BicycleParking < ApplicationRecord
  with_options presence: true do
    validates :name, uniqueness: true
    validates :location
    validates :opening_hours
    validates :motorcycle_price, if: :motorcycle_parkable?
    validates :latitude
    validates :longitude
    with_options numericality: {only_integer: true, greater_than_or_equal_to: 0} do
      validates :bicycle_capacity
      validates :motorized_bicycle_under_50cc_capacity
      validates :motorized_bicycle_under_125cc_capacity
      validates :bicycle_and_motorized_bicycle_under_50cc_capacity
      validates :motorcycle_capacity
    end
  end

  scope :motorcycle_parkable, -> { where('motorcycle_capacity > 0') }
  scope :motorized_bicycle_under_50cc_parkable, -> { where('motorized_bicycle_under_50cc_capacity > 0 or bicycle_and_motorized_bicycle_under_50cc_capacity > 0') }
  scope :motorized_bicycle_under_125cc_parkable, -> { where('motorized_bicycle_under_125cc_capacity > 0') }

  def motorized_bicycle_under_50cc_parkable?
    motorized_bicycle_under_50cc_capacity > 0 ||
    bicycle_and_motorized_bicycle_under_50cc_capacity > 0
  end

  def motorized_bicycle_under_125cc_parkable?
    motorized_bicycle_under_125cc_capacity > 0
  end

  def motorcycle_parkable?
    motorcycle_capacity > 0
  end
end
