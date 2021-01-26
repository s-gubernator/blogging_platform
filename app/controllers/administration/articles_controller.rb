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

    def approve_multiple
      skip_authorization

      @articles = Article.where(id: params[:article_ids])
      @articles.each do |article|
        article.update_attribute(:approved, true)
      end

      redirect_to administration_articles_url, notice: 'Articles approved'
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:id, article_ids: [])
    end
  end
end
