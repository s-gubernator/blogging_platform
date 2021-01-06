# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'routes to the Administration::DashboardController', type: :routing do
  it 'routes root for administration area to dashboard home' do
    get('/administration').should route_to('administration/dashboard#home')
  end
end
