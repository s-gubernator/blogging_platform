# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  let(:author) { create(:user_with_articles, articles_count: 10) }
  let(:articles) { author.articles }
  let(:article) { articles.last }

  let(:topic) { create(:topic) }

  let(:valid_attributes) { { id: 1, title: 'Test title', content: 'Test content', topic_id: topic.id } }
  let(:invalid_attributes) { { id: 2, title: '', content: '' } }

  describe 'GET /index' do
    context 'when user is not logged' do
      it 'returns unauthorized http status' do
        get :index
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user is logged' do
      it 'renders a successful response' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in(author)
        get :index
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    let(:params) { { id: article.id } }

    it 'renders a successful response' do
      get :show, params: params
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    context 'when user is not logged' do
      it 'returns unauthorized http status' do
        get :new
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user with role is logged' do
      login_simple

      it 'renders a successful response' do
        get :new
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    let(:params) { { article: valid_attributes } }

    context 'when user is not logged' do
      it 'returns unauthorized http status' do
        post :create, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'with valid parameters for logged user' do
      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in(author)
      end

      it "decreases author's articles count by 1" do
        post :create, params: params
        expect(author.articles.count).to eq(11)
      end

      it 'redirects to show created article' do
        post :create, params: params
        expect(response).to redirect_to(article_url(Article.last))
      end

      it 'checks last article attributes' do
        post :create, params: params
        expect(Article.last.title).to eq('Test title')
      end
    end

    context 'with invalid parameters' do
      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in(author)
      end

      it "doesn't change articles count" do
        post :create, params: { article: invalid_attributes }
        expect(author.articles.count).to eq(10)
      end

      it 'returns an error' do
        post :create, params: { article: invalid_attributes }
        expect(assigns(:article).errors.full_messages).to include("Title can't be blank")
      end
    end
  end

  describe 'GET /edit' do
    let(:params) { { id: article.id, Title: 'Edited title' } }

    context 'when user tries to edit not owned article' do
      login_simple

      it 'returns unauthorized http status' do
        get :edit, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context 'when user try to edit his article' do
      it 'render a successful response' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in(author)
        get :edit, params: params
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    let(:params) { { id: article.id, article: {title: 'Edited title' } } }

    context 'when user is not article owner' do
      login_simple

      it 'returns unauthorized http status' do
        patch :update, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context "with valid parameters for article's author" do
      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in(author)
      end

      it 'updates the requested article' do
        patch :update, params: params
        article.reload
        expect(article.title).to eq('Edited title')
      end

      it 'redirects to the updated article' do
        patch :update, params: params
        article.reload
        expect(response).to redirect_to(article_url(article))
      end
    end

    context "with invalid parameters for article's author" do
      it 'returns an error' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in(author)
        patch :update, params: { id: article.id,  article: invalid_attributes }
        expect(assigns(:article).errors.full_messages).to include("Title can't be blank")
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:params) { { id: articles.last.id } }

    context "when user is not article's author" do
      login_simple

      it 'returns unauthorized http status' do
        delete :destroy, params: params
        expect(response).to redirect_to(unauthorized_url)
      end
    end

    context "when user is article's author" do
      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in(author)
      end

      it "decreases author's articles count by 1" do
        delete :destroy, params: params
        expect(author.articles.count).to eq(9)
      end

      it 'redirects to articles list' do
        delete :destroy, params: params
        expect(response).to redirect_to(articles_url)
      end
    end
  end
end
