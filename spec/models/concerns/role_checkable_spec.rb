require 'rails_helper'

RSpec.describe RoleCheckable, type: :model do
  let(:user) { create(:user) }

  describe 'responds to dynamic role methods' do
    it { expect(user).to respond_to(:admin?) }
    it { expect(user).to respond_to(:editor?) }
    it { expect(user).to respond_to(:customer?) }
  end

  describe 'responds true for default role' do
    it { expect(user.admin?).to be false }
    it { expect(user.editor?).to be false }
    it { expect(user.customer?).to be true }
  end

  describe 'responds true for update role admin' do
    before { user.roles << Role.find_by(name: 'admin') }

    it { expect(user.admin?).to be true }
    it { expect(user.editor?).to be false }
    it { expect(user.customer?).to be true }
  end
end
