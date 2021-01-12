# frozen_string_literal: true

module NavigationHelper
  def main_nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    tag.li(class: class_name) do
      link_to(link_text, link_path)
    end
  end

  def nav_items
    @nav_items ||= [{ title: 'Home', url: '/' }]
  end

  def navigation_add(title, url)
    nav_items << { title: title, url: url }
  end

  def render_breadcrumbs
    render partial: 'shared/breadcrumbs', locals: { nav_items: nav_items }
  end
end
