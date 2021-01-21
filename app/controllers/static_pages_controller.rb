# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_after_action :verify_authorized

  def home
    @articles = Article.last(5)
  end
end
