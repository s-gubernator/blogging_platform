# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe 'GET /home' do
    subject! { get :home }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:home) }
  end
end
