# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
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

  describe 'associations' do
    it { expect(topic).to have_many(:articles) }
  end

  describe 'topic validation' do
    it { expect(topic).to validate_presence_of(:name) }
    it { expect(topic).to validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { expect(topic).to validate_length_of(:name).is_at_most(255) }
  end
end
