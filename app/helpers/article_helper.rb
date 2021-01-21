# frozen_string_literal: true

module ArticleHelper
  def author_name(article)
    article.author.present? ? article.author.full_name : 'without author'
  end
end
