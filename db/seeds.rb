# Users
User.destroy_all

p 'Start users generating...'
FactoryBot.create_list(:user, 20)
FactoryBot.create_list(:user, 5, :admin)

p '...Finish users generating'
p "Created #{User.count} users"
p "Created #{User.having_role(:admin).count} admins"
p "Created #{User.having_role(:simple).count} simple users"
