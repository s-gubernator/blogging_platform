# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Administration::DashboardController, type: :routing do
  it 'routes root for administration area to dashboard home' do
    expect(get('/administration')).to route_to('administration/dashboard#home')
  end
end
