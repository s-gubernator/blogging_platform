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
class Article < ApplicationRecord
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', inverse_of: :articles

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
