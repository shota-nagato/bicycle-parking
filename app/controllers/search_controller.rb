class SearchController < ApplicationController
  def index
    @search_params = session[:search_params]
  end
end
