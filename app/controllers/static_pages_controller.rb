# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_after_action :verify_authorized

  def home
    @articles = Article.order('created_at DESC').limit(10)
  end
end
