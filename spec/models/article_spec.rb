# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :integer
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { build(:article) }

  describe 'factory presence' do
    it 'check article' do
      article.save
      expect(article).to be_persisted
    end
  end

  describe 'associations' do
    it { expect(article).to belong_to(:topic).optional }
    it { expect(article).to belong_to(:author).class_name('User').optional }
  end

  describe 'article validation' do
    it { expect(article).to validate_presence_of(:title) }
    it { expect(article).to validate_length_of(:title).is_at_most(255) }
    it { expect(article).to validate_presence_of(:content) }
  end
end
