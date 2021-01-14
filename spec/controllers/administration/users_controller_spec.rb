# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::UsersController, type: :controller do
  render_views

  let!(:user) { create(:user) }

  describe 'GET /index' do
    context 'when user with role "admin" is logged' do
      login_admin

      subject! { get :index }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:index) }
    end

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns unauthorized error page' do
        get :index
        expect(response).to render_template('errors/unauthorized')
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when user with role "admin" is logged' do
      login_admin

      subject(:delete_action) { delete :destroy, params: params }

      let(:params) { { id: user.id } }

      it { expect { delete_action }.to change(User, :count).by(-1) }
      it { expect(delete_action).to redirect_to(administration_users_url) }
    end

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        delete :destroy, params: { id: user.id }
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns unauthorized error page' do
        delete :destroy, params: { id: user.id }
        expect(response).to render_template('errors/unauthorized')
      end
    end
  end
end
