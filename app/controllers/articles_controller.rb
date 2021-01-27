# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    authorize Article, :user_articles?
    @articles = current_user.articles.page(params[:page])
  end

  def show
    authorize @article, :visitor_show?
  end

  def new
    authorize Article
    @article = Article.new
  end

  def create
    authorize Article
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_url(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      redirect_to article_url(@article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :topic_id)
  end
end
