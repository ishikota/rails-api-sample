class ApiController < ActionController::API
  include ApiErrorRescuable

  def render_404
    raise ActionController::RoutingError.new('No route matches')
  end
end
