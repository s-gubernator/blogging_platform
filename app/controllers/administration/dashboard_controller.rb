# frozen_string_literal: true

module Administration
  class DashboardController < ApplicationController
    def home
      authorize :dashboard, :home?
    end
  end
end
