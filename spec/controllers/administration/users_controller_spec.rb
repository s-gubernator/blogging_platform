# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::UsersController, type: :controller do
  render_views

  let(:valid_user) { build(:user) }
  let(:invalid_user) { build(:user, first_name: '', last_name: '') }

  describe 'GET /index' do
    it 'renders a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      valid_user.save
      get :show, params: { id: valid_user.id }
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      valid_user.save
      get :edit, params: { id: valid_user.id }
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attr) { { first_name: 'Test', last_name: 'User', email: 'test.user@example.com' } }

      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_attr }
        end.to change(User, :count).by(1)
      end

      it 'redirects to show freshly created user' do
        post :create, params: { user: valid_attr }
        expect(response).to redirect_to(administration_user_url(User.last))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attr) { { first_name: '', last_name: '' } }

      it 'does not create a new user' do
        expect do
          post :create, params: { user: invalid_attr }
        end.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post :create, params: { user: invalid_attr }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { first_name: 'New', last_name: 'User', email: 'new.user@example.com' } }

      it 'updates the requested user' do
        valid_user.save
        patch :update, params: { id: valid_user.id, user: new_attributes }
        valid_user.reload
        expect(controller.notice).to eq('User was successfully updated.')
      end

      it 'redirects to the updated user' do
        valid_user.save
        patch :update, params: { id: valid_user.id, user: new_attributes }
        valid_user.reload
        expect(response).to redirect_to(administration_user_url(valid_user))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attr) { { first_name: '', last_name: '', email: '' } }

      it "renders a successful response (i.e. to display the 'edit' template)" do
        valid_user.save
        patch :update, params: { id: valid_user.id, user: invalid_attr }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested administration_user' do
      valid_user.save
      expect do
        delete :destroy, params: { id: valid_user.id }
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the administration_users list' do
      valid_user.save
      delete :destroy, params: { id: valid_user.id }
      expect(response).to redirect_to(administration_users_url)
    end
  end
end
