class BroadcastSpecificWorker
  include Sidekiq::Job

  sidekiq_options queue: :broadcast_specific

  def perform(params)
    p '======= START BROADCAST SPECIFIC WORKER ======='
    sleep_interval = rand((0.3)..(1.0))
    p "----- Sleep with #{sleep_interval}s -----"
    p params
    sleep(sleep_interval)
    p '======= FINISH BROADCAST SPECIFIC WORKER ======='
  end
end
