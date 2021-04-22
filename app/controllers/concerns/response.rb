# frozen_string_literal: true

module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def render_error(arg, status)
    render json: { errors: [I18n.t(arg)] }, status: status
  end
end
