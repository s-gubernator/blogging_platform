# frozen_string_literal: true

module TopicHelper
  def topic_breadcrumb_links
    {
      'Dashboard' => helpers.administration_root_path,
      'All topics' => helpers.administration_topics_path
    }
  end

  private

  def helpers
    Rails.application.routes.url_helpers
  end
end
