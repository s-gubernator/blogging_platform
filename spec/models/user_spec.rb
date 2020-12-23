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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'factory presence' do
    it 'check user' do
      user.save
      expect(user).to be_persisted
    end
  end

  describe 'user validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without first name' do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without last name' do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid if first name is too long' do
      user.first_name = 't' * 51
      expect(user).to_not be_valid
    end

    it 'is not valid if last name is too long' do
      user.last_name = 't' * 51
      expect(user).to_not be_valid
    end

    it 'is not valid if email is too long' do
      user.email =  't' * 244 + "@example.com"
      expect(user).to_not be_valid
    end
  end
end
