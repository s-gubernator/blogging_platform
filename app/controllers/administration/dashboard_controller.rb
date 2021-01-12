# frozen_string_literal: true

module Administration
  class DashboardController < Administration::BaseController
    def home
      authorize :dashboard, :home?
    end

    def test
      skip_authorization
    end
  end
end
