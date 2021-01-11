# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::UsersController, type: :controller do
  render_views

  let(:user) { build(:user) }

  describe 'GET /index' do
    context 'when user with role "admin" is logged' do
      login_admin

      it 'renders a successful response' do
        get :index
        expect(response).to be_successful
      end
    end

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns http unauthorized' do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /show' do
    context 'when user with role "admin" is logged' do
      login_admin

      it 'renders a successful response' do
        user.save
        get :show, params: { id: user.id }
        expect(response).to be_successful
      end
    end

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns http unauthorized' do
        user.save
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when user with role "admin" is logged' do
      login_admin

      it 'destroys the requested administration_user' do
        user.save
        expect do
          delete :destroy, params: { id: user.id }
        end.to change(User, :count).by(-1)
      end

      it 'redirects to the administration_users list' do
        user.save
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(administration_users_url)
      end
    end

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns http unauthorized' do
        user.save
        delete :destroy, params: { id: user.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
