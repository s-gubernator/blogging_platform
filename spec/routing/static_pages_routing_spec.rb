# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'routes to the StaticPagesController', type: :routing do
  it 'routes root to home' do
    get('/').should route_to('static_pages#home')
  end
end
