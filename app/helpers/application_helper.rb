# frozen_string_literal: true

module ApplicationHelper
  COPYRIGHT_START_YEAR = 2020

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    tag.li(class: class_name) do
      link_to(link_text, link_path)
    end
  end
end
