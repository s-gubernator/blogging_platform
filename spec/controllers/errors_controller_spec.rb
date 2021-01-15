# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  render_views

  describe 'GET /unauthorized' do
    subject! { get :unauthorized }

    it { expect(response).to have_http_status(:unauthorized) }
    it { expect(response).to render_template(:unauthorized) }
  end

  describe 'GET /not_found' do
    subject! { get :not_found }

    it { expect(response).to have_http_status(:not_found) }
    it { expect(response).to render_template(:not_found) }
  end

  describe 'GET /unprocessable_entity' do
    subject! { get :unprocessable_entity }

    it { expect(response).to have_http_status(:unprocessable_entity) }
    it { expect(response).to render_template(:unprocessable_entity) }
  end

  describe 'GET /internal_server_error' do
    subject! { get :internal_server_error }

    it { expect(response).to have_http_status(:internal_server_error) }
    it { expect(response).to render_template(:internal_server_error) }
  end
end
