class MapController < ApplicationController
  has_scope :motorized_bicycle_under_50cc_parkable, type: :boolean
  has_scope :motorized_bicycle_under_125cc_parkable, type: :boolean
  has_scope :motorcycle_parkable, type: :boolean

  def index
    @mapbox_japan_style = ENV["MAPBOX_JAPAN_STYLE"]
    bicycle_parkings = apply_scopes(BicycleParking).all
    if bicycle_parkings.count > 0
      flash[:notice] = "#{bicycle_parkings.count}件見つかりました"
    else
      flash[:alert] = '見つかりませんでした'
    end
    @data = bicycle_parkings.map { |parking| { latitude: parking.latitude, longitude: parking.longitude, tooltip: render_to_string(partial: 'map/info', locals: { parking: parking }) } }
  end
end
