# frozen_string_literal: true

module FooterHelper
  def copyright_year_range
    start_year = ApplicationHelper::COPYRIGHT_START_YEAR
    current_year = Time.zone.now.year

    current_year > start_year ? "#{start_year} - #{current_year}" : current_year.to_s
  end
end
