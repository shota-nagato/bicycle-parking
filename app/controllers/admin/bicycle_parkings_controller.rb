class Admin::BicycleParkingsController < Admin::ApplicationController
  def index
    @bicycle_parkings = BicycleParking.default_order
  end

  def show
    @bicycle_parking = BicycleParking.find(params[:id])
  end
end
