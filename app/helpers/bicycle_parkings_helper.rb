module BicycleParkingsHelper
  def capacity_text(parking)
    if parking.bicycle_and_motorized_bicycle_under_50cc_capacity > 0
      "自転車・原付(50cc以下)合わせて#{parking.bicycle_and_motorized_bicycle_under_50cc_capacity}台"
    else
      capacity_text = "自転車#{parking.bicycle_capacity}台"
      capacity_text << "、原付(50cc以下)#{parking.motorized_bicycle_under_50cc_capacity}台" if parking.motorized_bicycle_under_50cc_capacity > 0
      capacity_text << "、原付(125cc以下)#{parking.motorized_bicycle_under_125cc_capacity}台" if parking.motorized_bicycle_under_125cc_capacity > 0
      capacity_text << "、自動二輪車#{parking.motorcycle_capacity}台" if parking.motorcycle_capacity > 0
      capacity_text
    end
  end
end
