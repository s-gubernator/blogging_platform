# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET /home' do
    render_views
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end

    it 'renders home template' do
      get :home
      expect(response).to render_template(:home)
    end

    it 'renders home view' do
      get :home
      expect(response.body).to include('Hello in "Blogging Platform"')
    end
  end
end
