class MapController < ApplicationController
  before_action :set_japan_style_url
  before_action :set_access_token
  before_action :set_search_params

  has_scope :motorized_bicycle_under_50cc_parkable, type: :boolean
  has_scope :motorized_bicycle_under_125cc_parkable, type: :boolean
  has_scope :motorcycle_parkable, type: :boolean
  has_scope :available_all_day, type: :boolean

  def index
    bicycle_parkings = apply_scopes(BicycleParking).all
    if bicycle_parkings.count > 0
      flash.now[:notice] = "#{bicycle_parkings.count}件見つかりました"
    else
      flash.now[:alert] = "見つかりませんでした"
    end
    @bicycle_parkings_information = bicycle_parkings.map { |parking| {latitude: parking.latitude, longitude: parking.longitude, discription: render_to_string(partial: "map/discription", locals: {parking: parking})} }
  end

  private

  def set_japan_style_url
    @mapbox_japan_style = ENV["MAPBOX_JAPAN_STYLE"]
  end

  def set_access_token
    @mapbox_access_token = ENV["MAPBOX_ACCESS_TOKEN"]
  end

  def set_search_params
    session[:search_params] = search_params
  end

  def search_params
    params.permit(:motorized_bicycle_under_50cc_parkable, :motorized_bicycle_under_125cc_parkable, :motorcycle_parkable, :available_all_day)
  end
end
