class Admin::BicycleParkingsController < Admin::ApplicationController
  def index
    @bicycle_parkings = BicycleParking.default_order
  end
end
