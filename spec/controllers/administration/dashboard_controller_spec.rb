# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::DashboardController, type: :controller do
  render_views

  describe 'GET /home' do
    context 'when unregistered visitor open link /administration' do
      it 'returns http unauthorized' do
        get :home
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns json error message' do
        get :home
        body = JSON.parse(response.body)
        expect(body['message']).to eq('Access denied')
      end
    end

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

      it 'returns http unauthorized' do
        get :home
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns json error message' do
        get :home
        body = JSON.parse(response.body)
        expect(body['message']).to eq('Access denied')
      end
    end
  end
end
