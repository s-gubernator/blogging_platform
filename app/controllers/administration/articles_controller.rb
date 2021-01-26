# frozen_string_literal: true

module Administration
  class ArticlesController < Administration::BaseController
    before_action :set_article, only: %i[show approve disapprove]

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

      Article.approve_all(params[:article_ids])
      redirect_to administration_articles_url, notice: 'Articles approved'
    end

    def approve
      skip_authorization

      @article.approve
      redirect_to administration_article_url(@article), notice: 'Article approved.'
    end

    def disapprove
      skip_authorization

      @article.disapprove
      redirect_to administration_article_url(@article), notice: 'Article disapproved.'
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
