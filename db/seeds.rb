# Users
User.destroy_all
FactoryBot.create_list(:user, 25)
p "Created #{User.count} users"
