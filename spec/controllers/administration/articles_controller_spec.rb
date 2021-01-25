# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ArticlesController, type: :controller do
  render_views

  let!(:article) { create(:article) }

  describe 'GET /index' do
    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        get :index
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'renders a successful response' do
        get :index
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    let(:params) { { id: article.id } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        get :show, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'renders a successful response' do
        get :show, params: params
        expect(response).to be_successful
      end
    end
  end
end
