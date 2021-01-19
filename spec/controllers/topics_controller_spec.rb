# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let!(:topic) { create(:topic) }
  let(:valid_attributes) { { id: 1, name: 'Test' } }
  let(:invalid_attributes) { { id: 2, name: '' } }

  describe 'GET /index' do
    it 'renders a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get :show, params: { id: topic.id }
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
      get :edit, params: { id: topic.id, name: 'new_name' }
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      subject(:create_action) { post :create, params: { topic: valid_attributes } }

      it { expect { create_action }.to change(Topic, :count).by(1) }
      it { expect(create_action).to redirect_to(topic_url(Topic.last)) }
    end

    context 'with invalid parameters' do
      subject(:create_action) { post :create, params: { topic: invalid_attributes } }

      it { expect { create_action }.to change(Topic, :count).by(0) }

      it "renders a successful response (i.e. to display the 'new' template)" do
        post :create, params: { topic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'new_test_name' } }

      it 'updates the requested topic' do
        patch :update, params: { id: topic.id, topic: new_attributes }
        topic.reload
        expect(controller.notice).to eq('Topic was successfully updated.')
      end

      it 'redirects to the topic' do
        patch :update, params: { id: topic.id, topic: new_attributes }
        topic.reload
        expect(response).to redirect_to(topic_url(topic))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch :update, params: { id: topic.id, topic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    subject(:delete_action) { delete :destroy, params: params }

    let(:params) { { id: topic.id } }

    it { expect { delete_action }.to change(Topic, :count).by(-1) }
    it { expect(delete_action).to redirect_to(topics_url) }
  end
end