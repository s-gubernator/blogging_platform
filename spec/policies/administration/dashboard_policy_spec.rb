# frozen_string_literal: true

require 'rails_helper'

describe DashboardPolicy do
  subject(:dashboard_policy) { described_class }

  let(:simple_user) { build(:user) }
  let(:admin_user) { build(:user, :admin) }

  permissions :home? do
    it 'denies access for visitor' do
      expect(dashboard_policy).not_to permit(nil)
    end

    it 'denies access for simple user' do
      expect(dashboard_policy).not_to permit(simple_user)
    end

    it 'grants access for admin user' do
      expect(dashboard_policy).to permit(admin_user)
    end
  end
end
