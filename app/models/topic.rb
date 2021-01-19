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
class Topic < ApplicationRecord
  PREDEFINED_NAMES = %w[education fashion finance food lifestyle movies music politics sports travel].freeze
  TOPICS_PER_PAGE = 10

  has_many :atricles, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }

  paginates_per(TOPICS_PER_PAGE)
end
