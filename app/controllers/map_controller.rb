class MapController < ApplicationController
  def index
    @mapbox_japan_style = ENV["MAPBOX_JAPAN_STYLE"]
  end
end
