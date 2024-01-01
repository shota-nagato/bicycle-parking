class MapController < ApplicationController
  def index
    @mapbox_japan_style = ENV["MAPBOX_JAPAN_STYLE"]
    bicycle_parkings = BicycleParking.all
    @data = bicycle_parkings.map { |parking| { latitude: parking.latitude, longitude: parking.longitude, tooltip: render_to_string(partial: 'map/info', locals: { parking: parking }) } }
  end
end
