# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE)
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :integer
#
class Article < ApplicationRecord
  ARTICLES_PER_PAGE = 15

  belongs_to :topic, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', inverse_of: :articles, optional: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  paginates_per(ARTICLES_PER_PAGE)

  def self.approve_all(ids)
    where(id: ids).update_all(approved: true)
  end

  def approve
    update_attribute(:approved, true)
  end

  def disapprove
    update_attribute(:approved, false)
  end
end
