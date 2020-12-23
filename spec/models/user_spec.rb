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
  let(:user_without_email) { build(:user,
                                    first_name: Faker::Name.unique.first_name,
                                    last_name: Faker::Name.unique.last_name,
                                    email: nil) }

  def remove_apostrophe(string)
    if string.present? && string.scan(User::APOSTROPHE_REGEXP).any?
      string.gsub((User::APOSTROPHE_REGEXP), '_')
    else
      string
    end
  end

  # describe 'check factory presence' do
  #   it { expect(user).to be_persisted }
  # end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it 'should be valid with valid attributes' do
      expect(user).to be_valid
    end

    # default email will be assigned on save
    it 'should be valid without email' do
      user.email = nil
      user.save
      expect(user).to be_valid
    end

    it 'should not be valid without first name' do
      user.first_name = nil
      user.save
      expect(user).to_not be_valid
    end

    it 'should not be valid without last name' do
      user.last_name = nil
      user.save
      expect(user).to_not be_valid
    end
  end

  describe 'user without an email' do
    it 'should be created with default email' do
      first_name = user_without_email.first_name
      last_name = user_without_email.last_name
      default_email = "#{first_name}.#{remove_apostrophe(last_name)}@example.com".downcase
      user_without_email.save

      expect(user_without_email.email).to eq(default_email)
    end
  end
end
