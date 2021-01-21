# frozen_string_literal: true

module Administration
  class ArticlesController < Administration::BaseController
    skip_after_action :verify_authorized

    before_action :set_article, only: %i(show)

    def index
      @articles = Article.all.page(params[:page])
    end

    def show;  end

    private

    def set_article
      @article = Article.find(params[:id])
    end
  end
end
