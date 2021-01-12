# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::UsersController, type: :controller do
  render_views

  let!(:user) { create(:user) }

  describe 'GET /index' do
    context 'when user with role "admin" is logged' do
      login_admin
      subject(:users_controller) { get :index }

      it { expect(users_controller).to have_http_status(:success) }
    end

    context 'when user with role "simple" is logged' do
      login_simple
      subject(:users_controller) { get :index }

      it { expect(users_controller).to have_http_status(:unauthorized) }
    end
  end

  describe 'DELETE /destroy' do
    context 'when user with role "admin" is logged' do
      login_admin
      subject(:users_controller) { -> { delete :destroy, params: { id: user.id } } }

      it { expect(users_controller).to change(User, :count).by(-1) }

      it 'redirects to the users list' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(administration_users_url)
      end
    end

    context 'when user with role "simple" is logged' do
      login_simple
      subject(:users_controller) { delete :destroy, params: { id: user.id } }

      it { expect(users_controller).to have_http_status(:unauthorized) }
    end
  end
end
