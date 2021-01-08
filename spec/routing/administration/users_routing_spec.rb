# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/administration/users').to route_to('administration/users#index')
    end

    it 'routes to #new' do
      expect(get: '/administration/users/new').to route_to('administration/users#new')
    end

    it 'routes to #show' do
      expect(get: '/administration/users/1').to route_to('administration/users#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/administration/users/1/edit').to route_to('administration/users#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/administration/users').to route_to('administration/users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/administration/users/1').to route_to('administration/users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/administration/users/1').to route_to('administration/users#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/administration/users/1').to route_to('administration/users#destroy', id: '1')
    end
  end
end
