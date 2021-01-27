# frozen_string_literal: true

module Administration
  class ArticlesController < Administration::BaseController
    before_action :set_article, only: %i[show toggle_approve]

    def index
      authorize Article

      @q = Article.by_newest.ransack(params[:q])
      @articles = @q.result.includes(:topic, :author).page(params[:page])
    end

    def show
      authorize @article
    end

    def approve_multiple
      authorize Article, :approve_multiple?

      Article.approve_all(params[:article_ids])
      redirect_to administration_articles_url, notice: 'Articles approved'
    end

    def toggle_approve
      authorize @article, :toggle_approve?

      @article.toggle_approve
      status = I18n.t("article.approved.#{@article.approved}")
      redirect_to administration_article_url(@article), notice: "Article #{status}"
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
