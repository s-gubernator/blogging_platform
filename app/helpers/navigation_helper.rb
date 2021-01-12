module NavigationHelper
  def nav_items
    @nav_items ||= [ { title: 'Home', url: '/' } ]
  end

  def navigation_add(title, url)
    nav_items << { title: title, url: url }
  end

  def render_navigation
    render partial: 'shared/navigation', locals: { nav_items: nav_items }
  end
end
