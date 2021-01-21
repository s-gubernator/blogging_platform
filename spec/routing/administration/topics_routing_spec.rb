# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::TopicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'administration/topics').to route_to('administration/topics#index')
    end

    it 'routes to #show' do
      expect(get: 'administration/topics/1').to route_to('administration/topics#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: 'administration/topics/new').to route_to('administration/topics#new')
    end

    it 'routes to #edit' do
      expect(get: 'administration/topics/1/edit').to route_to('administration/topics#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'administration/topics').to route_to('administration/topics#create')
    end

    it 'routes to #update via PUT' do
      expect(put: 'administration/topics/1').to route_to('administration/topics#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'administration/topics/1').to route_to('administration/topics#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'administration/topics/1').to route_to('administration/topics#destroy', id: '1')
    end
  end
end
