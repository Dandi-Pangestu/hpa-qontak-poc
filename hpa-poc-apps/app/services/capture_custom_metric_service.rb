# frozen_string_literal: true

class CaptureCustomMetricService
  def initialize(name:, tags: [])
    @name = name
    @tags = tags
  end

  def capture(action: :increment, count: 0)
    return unless %w[increment count histogram].include? action.to_s

    metric = CustomMetricService.new(name: @name.to_s)
    case action.to_s
    when 'increment'
      metric.increment(tags: @tags)
    when 'count'
      metric.count(count: count, tags: @tags)
    when 'histogram'
      metric.histogram(count: count, tags: @tags)
    else
      raise 'Unknown Action!'
    end
  end
end
