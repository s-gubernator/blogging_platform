# Users
User.destroy_all

p 'Start users generating...'
FactoryBot.create_list(:user_with_articles, 20)
FactoryBot.create_list(:user, 5, :admin)

p '...Finish users generating'
p "Created #{User.count} users"
p "Created #{User.having_role(:admin).count} admins"
p "Created #{User.having_role(:simple).count} simple users"

# Topics
PREDEFINED_NAMES = %w(education fashion finance food lifestyle movies music politics sports travel)

topics_count_before_creating = Topic.count
p "Topics count before: #{topics_count_before_creating}"

PREDEFINED_NAMES.each do |name|
  Topic.create(name: name)
end

topics_count_after_creating = Topic.count
p "Topics count after: #{topics_count_after_creating}"
