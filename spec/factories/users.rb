# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_lower_email  (lower((email)::text)) UNIQUE
#
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    email { Faker::Internet.unique.safe_email }

    after(:build) do |user|
      user.email ||= %{
        #{user.first_name}.
        #{user.last_name.gsub(/['‘’]/, '_')}
        @example.com
      }.gsub(/\s+/, "").strip.downcase
    end
  end
end
