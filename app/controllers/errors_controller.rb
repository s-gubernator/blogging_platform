# frozen_string_literal: true

class ErrorsController < ApplicationController
  skip_after_action :verify_authorized

  def unauthorized
    render status: :unauthorized
  end

  def not_found
    render status: :not_found
  end

  def unprocessable_entity
    render status: :unprocessable_entity
  end

  def internal_server_error
    render status: :internal_server_error
  end
end
