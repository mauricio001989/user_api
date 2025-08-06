require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject(:user) { build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).scoped_to(:provider).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:roles).through(:user_roles) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end
end
