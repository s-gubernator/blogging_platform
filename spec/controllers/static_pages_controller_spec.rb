# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe 'GET /home' do
    subject!(:home_action) { get :home }

    it { expect(response).to have_http_status(:success) }
    it { expect(home_action).to render_template(:home) }
  end
end
