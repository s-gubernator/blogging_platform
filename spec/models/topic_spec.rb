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

    describe 'topic validation' do
      it { expect(topic).to validate_presence_of(:name) }
      it { expect(topic).to validate_length_of(:name).is_at_most(255) }
    end
  end
end
