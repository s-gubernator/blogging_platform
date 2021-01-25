# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ArticlesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'administration/articles').to route_to('administration/articles#index')
    end

    it 'routes to #show' do
      expect(get: 'administration/articles/1').to route_to('administration/articles#show', id: '1')
    end
  end
end
