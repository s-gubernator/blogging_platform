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
  let(:valid_user) { create(:user) }

  describe 'check factory presence' do
    it { expect(valid_user).to be_persisted }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it 'should be valid with valid attributes' do
      expect(valid_user).to be_valid
    end
  end
end
