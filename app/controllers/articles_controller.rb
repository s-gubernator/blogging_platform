# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @article = Article.find(params[:id])
  end
end
