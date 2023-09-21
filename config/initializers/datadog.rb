# === IMPORTANT ===
#     Due to a bug in the ddtrace gem it starts some worker when the gem is required.
#     Unless we make sure these environment variables are set we will log errors
#     https://github.com/DataDog/dd-trace-rb/issues/1065
# === IMPORTANT ===
ENV['DD_AGENT_HOST'] ||= 'ddagent'

require 'ddtrace'

Datadog.configure do |c|
    c.tracing.instrument :rails, service_name: 'mastodon-rails'
    c.tracing.instrument :sidekiq
    c.tracing.instrument :pg, service_name: 'mastodon-rails-pg'
    c.tracing.instrument :redis, service_name: 'mastodon-rails-redis'
    c.tracing.instrument :action_mailer
    c.tracing.instrument :aws
end
