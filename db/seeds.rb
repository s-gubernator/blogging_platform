User.destroy_all
Topic.destroy_all
Article.destroy_all

# =====================================
FactoryBot.create_list(:user_with_articles, 20)
FactoryBot.create_list(:user, 5, :admin)
# =====================================

p "Created #{User.count} users"
p "Created #{User.having_role(:admin).count} admins"
p "Created #{User.having_role(:simple).count} simple users"
p "Created topics: #{Topic.count}"
p "Created articles: #{Article.count}"
