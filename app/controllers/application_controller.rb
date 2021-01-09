# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  rescue_from Exception, with: :internal_server_error

  rescue_from ActionController::RoutingError,
              ::AbstractController::ActionNotFound,
              ActiveRecord::RecordNotFound,
               with: :not_found

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name email password])
  end

  def deny_access
    render template: 'errors/unauthorized', status: :unauthorized
  end

  def not_found
    render template: 'errors/not_found', status: :not_found
  end
end
