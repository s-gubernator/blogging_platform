# frozen_string_literal: true

module FooterHelper
  def footer_title
    'Content for footer'
  end

  def footer_description
    'Footer for "Blogging Platform".'
  end

  def copyright_year_range(start)
    start_year = start.to_i
    current_year = Time.zone.now.year

    current_year > start_year ? "#{start_year} - #{current_year}" : current_year.to_s
  end

  def copyright_link_text
    'Svitlana Gubernator'
  end

  def copyright_main_text
    'All Rights Reserved'
  end
end
