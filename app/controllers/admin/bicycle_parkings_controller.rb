class Admin::BicycleParkingsController < Admin::ApplicationController
  def index
    @bicycle_parkings = BicycleParking.default_order
  end

  def new
    @bicycle_parking = BicycleParking.new
  end

  def create
    @bicycle_parking = BicycleParking.new(bicycle_parking_params)
    if @bicycle_parking.save
      redirect_to admin_bicycle_parkings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bicycle_parking = BicycleParking.find(params[:id])
  end

  private

  def bicycle_parking_params
    params.require(:bicycle_parking).permit(
      :name,
      :location,
      :opening_hours,
      :bicycle_capacity,
      :motorized_bicycle_under_50cc_capacity,
      :motorized_bicycle_under_125cc_capacity,
      :bicycle_and_motorized_bicycle_under_50cc_capacity,
      :motorcycle_capacity,
      :motorcycle_price,
      :latitude,
      :longitude,
      :published
    )
  end
end
