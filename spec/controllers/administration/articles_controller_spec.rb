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

  describe 'PATCH /approve' do
    let(:article) { create(:article) }
    let(:params) { { id: article.id } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        patch :approve, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'approves the requested article' do
        patch :approve, params: params
        article.reload
        expect(article.approved).to eq(true)
      end

      it 'redirects to the article show' do
        patch :approve, params: params
        article.reload
        expect(response).to redirect_to(administration_article_url(article))
      end
    end
  end

  describe 'PATCH /disapprove' do
    let(:article) { create(:article, approved: true) }
    let(:params) { { id: article.id } }

    context 'when user with role "simple" is logged' do
      login_simple

      it 'returns unauthorized http status' do
        patch :disapprove, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role "admin" is logged' do
      login_admin

      it 'disapproves the requested article' do
        patch :disapprove, params: params
        article.reload
        expect(article.approved).to eq(false)
      end

      it 'redirects to the article show' do
        patch :disapprove, params: params
        article.reload
        expect(response).to redirect_to(administration_article_url(article))
      end
    end
  end
end
