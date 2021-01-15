# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'routes to the ErrorsController', type: :routing do
  describe 'routing' do
    it 'routes to #unauthorized' do
      expect(get('/401')).to route_to('errors#unauthorized')
    end

    it 'routes to #not_found' do
      expect(get('/404')).to route_to('errors#not_found')
    end

    it 'routes to #unprocessable_entity' do
      expect(get('/422')).to route_to('errors#unprocessable_entity')
    end

    it 'routes to #internal_server_error' do
      expect(get('/500')).to route_to('errors#internal_server_error')
    end
  end
end
