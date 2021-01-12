# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe 'GET /home' do
    subject!(:static_pages_controller) { get :home }

    it { expect(static_pages_controller).to have_http_status(:success) }
    it { expect(static_pages_controller).to render_template(:home) }
  end
end
