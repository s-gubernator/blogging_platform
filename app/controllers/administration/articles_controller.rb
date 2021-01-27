# frozen_string_literal: true

module Administration
  class ArticlesController < Administration::BaseController
    before_action :set_article, only: %i[show]

    def index
      authorize Article

      @q = Article.ransack(params[:q])
      @articles = @q.result.includes(:topic, :author).page(params[:page])
    end

    def show
      authorize @article
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end
  end
end
