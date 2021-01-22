# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_after_action :verify_authorized

  before_action :authenticate_user!, except: %i(show)
  before_action :correct_user, only: %i(edit update destroy)
  before_action :set_article, only: %i(show edit update destroy)

  def index
    @articles = Article.where(user_id: current_user.id).page(params[:page])
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_url(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
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

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url, notice: 'You have no permission to perform this action' if @article.nil?
  end
end
