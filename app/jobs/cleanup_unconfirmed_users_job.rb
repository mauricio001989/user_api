class CleanupUnconfirmedUsersJob < ApplicationJob
  queue_as :cleanup_unconfirmed_users

  def perform
     unconfirmed_users = User.where(confirmed_at: nil).where('created_at < ?', 24.hours.ago)

    unconfirmed_users.destroy_all
  end
end
