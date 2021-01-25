# frozen_string_literal: true

require 'rails_helper'

describe ArticlePolicy do
  subject(:article_policy) { described_class }

  let(:author) { create(:user_with_articles, articles_count: 1) }
  let(:last_article) { author.articles.last }
  let(:simple_user) { create(:user) }

  permissions :user_articles?, :create?, :new? do
    it 'denies access for visitor' do
      expect(article_policy).not_to permit(nil)
    end

    it 'grants access for author' do
      expect(article_policy).to permit(author)
    end
  end

  permissions :visitor_show? do
    it 'grants access for all users' do
      expect(article_policy).to permit(nil)
    end
  end

  permissions :update?, :edit?, :destroy? do
    it 'denies access for simple user' do
      expect(article_policy).not_to permit(simple_user, last_article)
    end

    it 'grants access for author' do
      expect(article_policy).to permit(author, last_article)
    end
  end
end
