class Admin::BicycleParkingsController < Admin::ApplicationController
  before_action :set_bicycle_parking, only: %i[show edit update destroy]
  before_action :set_access_token, only: :show
  before_action :set_japan_style_url, only: :show

  def index
    @bicycle_parkings = BicycleParking.default_order
  end

  def show
    @bicycle_parking_information = [{latitude: @bicycle_parking.latitude, longitude: @bicycle_parking.longitude, discription: render_to_string(partial: "map/discription", locals: {parking: @bicycle_parking})}]
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

  def set_japan_style_url
    @mapbox_japan_style = ENV["MAPBOX_JAPAN_STYLE"]
  end

  def set_access_token
    @mapbox_access_token = ENV["MAPBOX_ACCESS_TOKEN"]
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
