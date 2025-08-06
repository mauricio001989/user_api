require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1') }

  config.on(:startup) do
    schedule_file = File.expand_path('../../sidekiq.yml', __FILE__)
    if File.exist?(schedule_file)
      Sidekiq.schedule = YAML.load_file(schedule_file)['schedule']
      SidekiqScheduler::Scheduler.instance.reload_schedule!
    end
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1') }
end
