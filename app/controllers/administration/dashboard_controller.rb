# frozen_string_literal: true

module Administration
  class DashboardController < ApplicationController
    after_action :verify_authorized

    def home
      authorize :dashboard, :home?
    end
  end
end
