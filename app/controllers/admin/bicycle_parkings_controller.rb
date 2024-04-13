class Admin::BicycleParkingsController < Admin::ApplicationController
  before_action :set_bicycle_parking, only: %i[show edit update destroy]

  def index
    @bicycle_parkings = BicycleParking.default_order
  end

  def show
  end

  def new
    @bicycle_parking = BicycleParking.new
  end

  def edit
  end

  def create
    @bicycle_parking = BicycleParking.new(bicycle_parking_params)
    if @bicycle_parking.save
      redirect_to admin_bicycle_parkings_path, notice: "作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bicycle_parking.update(bicycle_parking_params)
      redirect_to admin_bicycle_parkings_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bicycle_parking.destroy!
    redirect_to admin_bicycle_parkings_path, notice: "削除しました"
  end

  private

  def set_bicycle_parking
    @bicycle_parking = BicycleParking.find(params[:id])
  end

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
