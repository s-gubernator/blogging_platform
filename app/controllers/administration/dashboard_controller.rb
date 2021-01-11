# frozen_string_literal: true

module Administration
  class DashboardController < Administration::BaseController
    def home
      authorize :dashboard, :home?
    end
  end
end
