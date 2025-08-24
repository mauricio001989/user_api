class CleanupUnconfirmedUsersJob < ApplicationJob
  queue_as :cleanup_unconfirmed_users

  def perform
    # TODO: This job is only intended as an example to validate the integration with Rails Active Job.
    # - You can adjust the `1.day.ago` to any desired time range for example '1.minute.ago'.
    # For manual execution:
    # - 'bin/rails runner CleanupUnconfirmedUsersJob.perform_now'
    # For background execution: This job is triggered by config/recurring.yml.
    # - 'bin/jobs'
    # Logs available in:
    # - log/development.log
    # References:
    # - Active Job Basics: https://guides.rubyonrails.org/active_job_basics.html
    # - Solid Queue: https://github.com/rails/solid_queue
    #

    unconfirmed_users = User.where(confirmed_at: nil).where('created_at < ?', 1.day.ago)

    Rails.logger.info unconfirmed_users.as_json

    unconfirmed_users.destroy_all
  end
end
