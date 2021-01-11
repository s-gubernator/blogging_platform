# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/administration/users').to route_to('administration/users#index')
    end

    it 'routes to #show' do
      expect(get: '/administration/users/1').to route_to('administration/users#show', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/administration/users/1').to route_to('administration/users#destroy', id: '1')
    end
  end
end
