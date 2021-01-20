# frozen_string_literal: true

require 'rails_helper'

describe TopicPolicy do
  subject(:topic_policy) { described_class }

  let(:simple_user) { build(:user) }
  let(:admin_user) { build(:user, :admin) }

  context 'when visitor go to page' do
    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'denies access for visitor' do
        expect(topic_policy).not_to permit(nil)
      end
    end
  end

  context 'when admin user go to page' do
    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'grants access for admin user' do
        expect(topic_policy).to permit(admin_user)
      end
    end
  end

  context 'when simple user go to page' do
    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it 'denies access for simple user' do
        expect(topic_policy).not_to permit(simple_user)
      end
    end
  end
end
