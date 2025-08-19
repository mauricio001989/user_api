require 'rails_helper'

RSpec.describe CleanupUnconfirmedUsersJob, type: :job do
  let!(:old_unconfirmed_user) { create(:user, :unconfirmed_no_email, created_at: 8.day.ago) }
  let!(:recent_unconfirmed_user) { create(:user, :unconfirmed_no_email, created_at: 1.day.ago) }
  let!(:confirmed_user) { create(:user) }

  it "deletes only old unconfirmed users" do
    expect { described_class.perform_now }.to change { User.count }.by(-2)

    expect(User.exists?(old_unconfirmed_user.id)).to be false
    expect(User.exists?(recent_unconfirmed_user.id)).to be false
    expect(User.exists?(confirmed_user.id)).to be true
  end
end
