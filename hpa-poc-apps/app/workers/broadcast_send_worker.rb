class BroadcastSendWorker
  include Sidekiq::Job

  sidekiq_options queue: :broadcast_send

  def perform(params)
    p '======= START BROADCAST SEND WORKER ======='
    sleep_interval = rand((0.3)..(1.0))
    p "----- Sleep with #{sleep_interval}s -----"
    p params
    sleep(sleep_interval)
    p '======= FINISH BROADCAST SEND WORKER ======='
  end
end
