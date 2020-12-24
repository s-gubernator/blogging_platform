require 'factory_bot_rails'

# Users
User.destroy_all
25.times do
  FactoryBot.create(:user)
end

p "Created #{User.count} users"
