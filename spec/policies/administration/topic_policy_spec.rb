# frozen_string_literal: true

require 'rails_helper'

describe TopicPolicy do
  subject(:topic_policy) { described_class }

  let(:simple_user) { build(:user) }
  let(:admin_user) { build(:user, :admin) }

  context 'when visitor go to page' do
    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'prohibits visitors access' do
        expect(topic_policy).not_to permit(nil)
      end
    end
  end

  context 'when admin user is logged' do
    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'permits admin access' do
        expect(topic_policy).to permit(admin_user)
      end
    end
  end

  context 'when simple user is logged' do
    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'denies access' do
        expect(topic_policy).not_to permit(simple_user)
      end
    end
  end
end
