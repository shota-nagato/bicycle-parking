class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, with: :_render_404

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private

  def _render_404(e = nil)
    logger.info "Rendering 404 with excaption: #{e.message}" if e
    render "errors/404", status: :not_found, layout: "error"
  end
end
