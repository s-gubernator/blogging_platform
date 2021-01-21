# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ArticleHelper do
  let(:links) { { 'Dashboard' => '/administration', 'All articles' => '/administration/articles' } }
  let(:author) { create(:user_with_articles, first_name: 'Test', last_name: 'User', articles_count: 1) }
  let(:articles) { author.articles }

  describe '#article_breadcrumb_links' do
    it 'returns correct breadcrumbs links' do
      expect(article_breadcrumb_links).to eq(links)
    end
  end

  describe '#author_name' do
    let(:article) { create(:article) }

    it 'returns author full name' do
      expect(author_name(articles.first)).to eq('Test User')
    end

    it 'returns "without author" text' do
      article.author.destroy
      article.reload
      expect(author_name(article)).to eq('without author')
    end
  end
end
