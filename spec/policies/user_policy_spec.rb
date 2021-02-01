# frozen_string_literal: true

require 'rails_helper'

describe UserPolicy do
  subject(:user_policy) { described_class }

  let(:user) { build(:user) }
  let(:another_user) { build(:user) }

  permissions :show?, :destroy? do
    it 'grants access for current user' do
      expect(user_policy).to permit(user, user)
    end

    it 'denies access for other user' do
      expect(user_policy).not_to permit(user, another_user)
    end
  end
end
