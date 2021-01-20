# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::TopicsController, type: :controller do
  render_views

  let!(:topic) { create(:topic) }
  let(:valid_attributes) { { id: 1, name: 'Test' } }
  let(:invalid_attributes) { { id: 2, name: '' } }

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
    let(:params) { { id: topic.id } }

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

  describe 'GET /new' do
    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        get :new
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'renders a successful response' do
        get :new
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    let(:params) { { topic: valid_attributes } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        post :create, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'with valid parameters for admin user' do
      login_admin

      subject(:create_action) { post :create, params: params }

      it { expect { create_action }.to change(Topic, :count).by(1) }
      it { expect(create_action).to redirect_to(administration_topic_url(Topic.last)) }
    end

    context 'with invalid parameters for admin user' do
      login_admin

      subject(:create_action) { post :create, params: { topic: invalid_attributes } }

      it { expect { create_action }.to change(Topic, :count).by(0) }

      it "renders a successful response (i.e. to display the 'new' template)" do
        post :create, params: { topic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /edit' do
    let(:params) { { id: topic.id, name: 'new_name' } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        get :edit, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'render a successful response' do
        get :edit, params: params
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    let(:params) { { id: topic.id, topic: { name: 'new_test_name' } } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        patch :update, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'with valid parameters for admin user' do
      login_admin

      it 'updates the requested topic' do
        patch :update, params: params
        topic.reload
        expect(topic.name).to eq('new_test_name')
      end

      it 'redirects to the topic' do
        patch :update, params: params
        topic.reload
        expect(response).to redirect_to(administration_topic_url(topic))
      end
    end

    context 'with invalid parameters for admin user' do
      login_admin

      it 'return a non-empty list of errors' do
        patch :update, params: { id: topic.id, topic: invalid_attributes }
        expect(assigns(:topic).errors.full_messages).to eq(["Name can't be blank"])
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:params) { { id: topic.id } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        delete :destroy, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      subject(:delete_action) { delete :destroy, params: params }

      it { expect { delete_action }.to change(Topic, :count).by(-1) }
      it { expect(delete_action).to redirect_to(administration_topics_url) }
    end
  end
end
