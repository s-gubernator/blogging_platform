# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let(:params) { { id: user.id } }

  describe 'GET /show' do
    context "when user go to another user's profile page" do
      before do
        sign_in(another_user)
      end

      it 'returns unauthorized http status' do
        get :show, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user go to his own profile page' do
      before do
        sign_in(user)
      end

      it 'renders a successful response' do
        get :show, params: params
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    context "when user try to delete another user's profile" do
      before do
        sign_in(another_user)
      end

      it 'returns unauthorized http status' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user try to delete his own profile' do
      subject(:delete_action) { delete :destroy, params: params }

      before do
        sign_in(user)
      end

      it { expect { delete_action }.to change(User, :count).by(-1) }
      it { expect(delete_action).to redirect_to(root_url) }
    end
  end
end
