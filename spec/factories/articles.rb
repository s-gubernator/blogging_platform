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
FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }

    association :topic
    author factory: :user
  end
end
