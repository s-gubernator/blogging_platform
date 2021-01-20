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
class Topic < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 255 }
end
