FactoryBot.define do
  factory :bicycle_parking do
    name { "大分駅駐輪場" }
    location { "大分市中央町" }
    opening_hours { "終日" }
    bicycle_capacity { 23 }
    motorized_bicycle_under_50cc_capacity { 12 }
    motorized_bicycle_under_125cc_capacity { 0 }
    bicycle_and_motorized_bicycle_under_50cc_capacity { 0 }
    motorcycle_capacity { 0 }
    motorcycle_price { "" }
    latitude { 33.17688209730566 }
    longitude { 131.61579466820422 }
    published { true }
  end
end
