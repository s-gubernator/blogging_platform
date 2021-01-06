# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::DashboardController, type: :controller do
  describe 'GET /home' do
    render_views

    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end

    it 'renders home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end
end
