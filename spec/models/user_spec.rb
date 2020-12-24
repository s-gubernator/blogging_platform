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
    subject { user }

    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_most(50) }

    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_most(50) }

    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { (user.email).should match(URI::MailTo::EMAIL_REGEXP) }
  end

  describe 'test user without email' do
    let(:user_without_email) { build(:user,
                                     first_name: 'Test',
                                     last_name: 'User',
                                     email: nil) }

    it 'set default email' do
      user_without_email.save
      expect(user_without_email).to be_valid
      expect(user_without_email.email).to eq('test.user@example.com')
    end
  end

  describe '#full_name' do
    let(:test_user) { create(:user,
                              first_name: 'Test',
                              last_name: 'User') }
    it { should respond_to(:full_name) }

    it 'collects Full Name from first_name and last_name' do
      full_name = test_user.full_name
      expect(full_name).to eq('Test User')
    end
  end
end
