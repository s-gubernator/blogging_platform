# frozen_string_literal: true

require 'rails_helper'

describe TopicPolicy do
  subject(:topic_policy) { described_class }

  let(:simple_user) { build(:user) }
  let(:admin_user) { build(:user, :admin) }

  permissions :index?, :show? do
    it 'grants access for all visitors' do
      expect(topic_policy).to permit(nil)
    end
  end

  context 'when visitor go to page' do
    permissions :new?, :create?, :edit?, :update?, :destroy? do
      it 'prohibits visitors access' do
        expect(topic_policy).not_to permit(nil)
      end
    end
  end

  context 'when admin user is logged' do
    permissions :new?, :create?, :edit?, :update?, :destroy? do
      it 'permits admin access' do
        expect(topic_policy).to permit(admin_user)
      end
    end
  end

  context 'when simple user is logged' do
    permissions :new?, :create? do
      it 'grant access' do
        expect(topic_policy).to permit(simple_user)
      end
    end

    permissions :edit?, :update?, :destroy? do
      it 'denies access' do
        expect(topic_policy).not_to permit(simple_user)
      end
    end
  end
end
