# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ArticlesController, type: :controller do
  render_views

  let!(:article) { create(:article) }

  describe 'GET /index' do
    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        get :index
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'renders a successful response' do
        get :index
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    let(:params) { { id: article.id } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        get :show, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'renders a successful response' do
        get :show, params: params
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /approve_multiple' do
    let(:author) { create(:user_with_articles, articles_count: 3) }
    let(:articles) { author.articles }
    let(:article_ids) { articles.pluck(:id) }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        patch :approve_multiple, params: { article_ids: article_ids }
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'approves the requested articles collection' do
        patch :approve_multiple, params: { article_ids: article_ids }
        articles.each(&:reload)
        expect(articles.pluck(:approved)).not_to include(false)
      end

      it 'redirects to the articles index' do
        patch :approve_multiple, params: { article_ids: article_ids }
        articles.each(&:reload)
        expect(response).to redirect_to(administration_articles_url)
      end
    end
  end

  describe 'PATCH /toggle_approve' do
    let(:not_approved_article) { create(:article) }
    let(:approved_article) { create(:article, approved: true) }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        patch :toggle_approve, params: { id: not_approved_article.id }
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'approves unapproved article' do
        patch :toggle_approve, params: { id: not_approved_article.id }
        not_approved_article.reload
        expect(not_approved_article.approved).to eq(true)
      end

      it 'disapproves approved article' do
        patch :toggle_approve, params: { id: approved_article.id }
        approved_article.reload
        expect(approved_article.approved).to eq(false)
      end

      it 'redirects to the article show' do
        patch :toggle_approve, params: { id: not_approved_article.id }
        not_approved_article.reload
        expect(response).to redirect_to(administration_article_url(not_approved_article))
      end
    end
  end
end
