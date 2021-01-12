# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::UsersController, type: :controller do
  render_views

  let!(:user) { create(:user) }

  describe 'GET /index' do
    context 'when user with role "admin" is logged' do
      login_admin
      subject(:index_action) { get :index }

      it { expect(index_action).to have_http_status(:success) }
    end

    context 'when user with role "simple" is logged' do
      login_simple
      subject(:index_action) { get :index }

      it { expect(index_action).to have_http_status(:unauthorized) }
    end
  end

  describe 'DELETE /destroy' do
    subject!(:delete_action) { delete :destroy, params: { id: user.id } }

    context 'when user with role "admin" is logged' do
      login_admin
      subject(:delete_action_lambda) { -> { delete :destroy, params: { id: user.id } } }

      it { expect(delete_action_lambda).to change(User, :count).by(-1) }
      it { expect(delete_action).to redirect_to(administration_users_url) }
    end

    context 'when user with role "simple" is logged' do
      login_simple

      it { expect(delete_action).to have_http_status(:unauthorized) }
    end
  end
end
