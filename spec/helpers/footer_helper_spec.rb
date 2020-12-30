# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FooterHelper do
  let(:current_year) { Time.zone.now.year }

  it 'returns only start year' do
    stub_const('ApplicationHelper::COPYRIGHT_START_YEAR', current_year)
    expect(copyright_year_range).to eq(current_year.to_s)
  end

  it 'returns year range' do
    stub_const('ApplicationHelper::COPYRIGHT_START_YEAR', 2017)
    expect(copyright_year_range).to eq("2017 - #{current_year}")
  end
end
