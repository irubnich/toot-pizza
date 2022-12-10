require 'ddtrace'

Datadog.configure do |c|
    c.tracing.instrument :rails, service_name: 'mastodon-rails'
    c.tracing.instrument :sidekiq
    c.tracing.instrument :pg, service_name: 'mastodon-rails-pg'
    c.tracing.instrument :redis, service_name: 'mastodon-rails-redis'
    c.tracing.instrument :action_mailer
    c.tracing.instrument :aws
end
