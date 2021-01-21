# frozen_string_literal: true

require 'rails_helper'

describe ArticlePolicy do
  subject(:article_policy) { described_class }

  let(:simple_user) { build(:user) }
  let(:admin_user) { build(:user, :admin) }

  permissions :index?, :show? do
    it 'denies access for visitor' do
      expect(article_policy).not_to permit(nil)
    end

    it 'denies access for simple user' do
      expect(article_policy).not_to permit(simple_user)
    end

    it 'grants access for admin user' do
      expect(article_policy).to permit(admin_user)
    end
  end
end
