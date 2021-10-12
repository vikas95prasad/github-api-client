# frozen_string_literal: true

module ResponseHelper
  def render_success(message)
    render_with_status_and_message(message: message, status: :created)
  end

  def render_not_found(message)
    render_with_status_and_message(message: message, status: :not_found)
  end

  def render_unprocessable_entity(message)
    render_with_status_and_message(message: message, status: :unprocessable_entity)
  end

  def render_with_status_and_message(message:, status:)
    render json: { message: message }, status: status
  end

  def render_required_parameter_missing
    render_unprocessable_entity("Required parameter missing.")
  end
end
