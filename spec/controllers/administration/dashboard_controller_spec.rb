# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::DashboardController, type: :controller do
  describe 'GET /home' do
    render_views

    context 'when user with role "admin" is logged' do
      login_admin

      it 'returns http success' do
        get :home
        expect(response).to have_http_status(:success)
      end

      it 'renders home template' do
        get :home
        expect(response).to render_template(:home)
      end
    end

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns http success' do
        get :home
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
