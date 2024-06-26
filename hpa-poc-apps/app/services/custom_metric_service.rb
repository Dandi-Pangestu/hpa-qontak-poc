# frozen_string_literal: true

require 'datadog/statsd'

class CustomMetricService
  def initialize(name:)
    @statsd = Datadog::Statsd.new(ENV['STATSD_HOST'], ENV['STATSD_PORT'].to_i)
    @name   = "app_chat_#{name}"
  end

  def increment(tags: [])
    @statsd.increment(@name, tags: tags)
    @statsd.flush(sync: true)
    @statsd.close
  end

  def count(count: 0, tags: [])
    @statsd.count(@name, count, tags: tags)
    @statsd.flush(sync: true)
    @statsd.close
  end

  def histogram(count: 0, tags: [])
    @statsd.histogram(@name, count, tags: tags)
    @statsd.flush(sync: true)
    @statsd.close
  end
end
