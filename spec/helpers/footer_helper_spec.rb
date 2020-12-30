# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FooterHelper do
  it 'returns only start year' do
    expect(copyright_year_range(2020)).to eq('2020')
  end

  it 'returns year range' do
    expect(copyright_year_range(2017)).to eq("2017 - #{Time.zone.now.year}")
  end
end
