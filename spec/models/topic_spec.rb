# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { build(:topic) }

  describe 'factory presence' do
    it 'check topic' do
      topic.save
      expect(topic).to be_persisted
    end
  end
end
