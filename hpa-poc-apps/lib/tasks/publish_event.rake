namespace :publisher do
  desc 'Publish event to message broker bundle exec rake app:publisher:sidekiq'
  task sidekiq_01: :environment do
    (1..7000).each do |i|
      WaCloudBroadcastSendWorker.perform_async(12345, { 'seq': i })
    end
  end

  task sidekiq_01: :environment do
    (1..2000).each do |i|
      BroadcastCreateMessageWorker.perform_async({ 'seq': i })
    end
    (1..2000).each do |i|
      BroadcastSendWorker.perform_async({ 'seq': i })
    end
    (1..3000).each do |i|
      BroadcastSpecificWorker.perform_async({ 'seq': i })
    end
  end
end
