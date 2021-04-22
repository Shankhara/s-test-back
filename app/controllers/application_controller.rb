# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  rescue_from ActionController::ParameterMissing, with: :response_error
  rescue_from ActiveRecord::RecordNotFound, with: :response_error

  private

  def response_error(error)
    json_response({ error: [error.message] }, 422)
  end
end
