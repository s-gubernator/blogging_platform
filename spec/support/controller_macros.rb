# frozen_string_literal: true

module ControllerMacros
  def login_admin
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(FactoryBot.create(:user, :admin))
    end
  end

  def login_simple
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(FactoryBot.create(:user))
    end
  end
end
