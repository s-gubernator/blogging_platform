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

    it 'returns "Deleted user" text' do
      article.author.destroy
      article.reload
      expect(author_name(article)).to eq('Deleted user')
    end
  end

  describe '#topic_name' do
    let(:topic) { create(:topic, name: 'Test') }
    let(:article) { create(:article, topic_id: topic.id) }

    it 'returns topic name' do
      expect(topic_name(article)).to eq('Test')
    end

    it 'returns "uncategorized" text' do
      article.topic.destroy
      article.reload
      expect(topic_name(article)).to eq('uncategorized')
    end
  end

  describe '#toggle_button_name' do
    context 'when article approved' do
      let(:article) { create(:article, approved: true) }

      it 'returns "Disapprove" button name' do
        expect(toggle_button_name(article.approved)).to eq('Disapprove')
      end
    end

    context 'when article not approved' do
      let(:article) { create(:article) }

      it 'returns "Approve" button name' do
        expect(toggle_button_name(article.approved)).to eq('Approve')
      end
    end
  end
end
