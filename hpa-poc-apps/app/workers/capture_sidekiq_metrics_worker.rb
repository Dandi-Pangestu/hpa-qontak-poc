class CaptureSidekiqMetricsWorker
  include Sidekiq::Job

  sidekiq_options queue: :capture_sidekiq_metrics, retry: false

  def perform
    Sidekiq::Queue.all.each do |queue|
      CaptureCustomMetricService.new(name: 'queue_size', tags: ["queue_name:#{queue.name}"]).capture(action: :count, count: queue.size)
      CaptureCustomMetricService.new(name: 'queue_latency', tags: ["queue_name:#{queue.name}"]).capture(action: :count, count: queue.latency)
    end
  end
end
