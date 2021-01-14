# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::DashboardController, type: :controller do
  render_views

  describe 'GET /home' do
    # context 'when unregistered visitor open link /administration' do
    #   it 'raises NotAuthorizedError' do
    #     get :home
    #     expect{ response }.to raise_error(Pundit::NotAuthorizedError)
    #   end
    #
    #   it 'returns unauthorized error page' do
    #     get :home
    #     expect(response).to render_template('errors/unauthorized')
    #   end
    # end

    context 'when user with role "admin" is logged' do
      login_admin
      subject! { get :home }

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:home) }
    end

    # context 'when user with role "simple" is logged' do
    #   login_simple
    #
    #   it 'returns unauthorized status for simple user' do
    #     get :home
    #     expect { response }.to raise_error(Pundit::NotAuthorizedError)
    #   end
    #
    #   it 'returns unauthorized error page' do
    #     get :home
    #     expect(response).to render_template('errors/unauthorized')
    #   end
    # end
  end
end
