module ApiErrorRescuable
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      render_error(status: :internal_server_error, error: e)
    end

    rescue_from ActionController::RoutingError do |e|
      render_error(status: :not_found, error: e)
    end
    rescue_from ActiveRecord::RecordNotFound do |e|
      render_error(status: :not_found, error: e)
    end

    def render_error(status:, error:)
      render_error_message(status: status, message: error.message)
    end

    def render_error_message(status:, message:)
      render json: { message: message }, status: status
    end
  end
end
