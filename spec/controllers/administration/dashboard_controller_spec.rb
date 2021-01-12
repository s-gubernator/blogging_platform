# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::DashboardController, type: :controller do
  render_views

  describe 'GET /home' do
    context 'when unregistered visitor open link /administration' do
      subject!(:dashboard_controller) { get :home }

      it { expect(dashboard_controller).to have_http_status(:unauthorized) }

      it 'returns json error message' do
        body = JSON.parse(response.body)
        expect(body['message']).to eq('Access denied')
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin
      subject!(:dashboard_controller) { get :home }

      it { expect(dashboard_controller).to have_http_status(:success) }
      it { expect(dashboard_controller).to render_template(:home) }
    end

    context 'when user with role "simple" is logged' do
      login_simple
      subject!(:dashboard_controller) { get :home }

      it { expect(dashboard_controller).to have_http_status(:unauthorized) }

      it 'returns json error message' do
        body = JSON.parse(response.body)
        expect(body['message']).to eq('Access denied')
      end
    end
  end
end
