# frozen_string_literal: true

module ArticleHelper
  def author_name(article)
    article.author.present? ? article.author.full_name : 'Deleted user'
  end

  def topic_name(article)
    article.topic.present? ? article.topic.name : 'uncategorized'
  end

  def article_breadcrumb_links
    {
      'Dashboard' => helpers.administration_root_path,
      'All articles' => helpers.administration_articles_path
    }
  end

  def status_class(article)
    article.approved ?  'success' : 'danger'
  end

  private

  def helpers
    Rails.application.routes.url_helpers
  end
end
