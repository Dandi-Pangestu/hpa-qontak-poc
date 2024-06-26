class BroadcastCreateMessageWorker
  include Sidekiq::Job

  sidekiq_options queue: :broadcast_create_message

  def perform(params)
    p '======= START BROADCAST CREATE MESSAGE WORKER ======='
    sleep_interval = rand((0.3)..(1.0))
    p "----- Sleep with #{sleep_interval}s -----"
    p params
    sleep(sleep_interval)
    p '======= FINISH BROADCAST CREATE MESSAGE WORKER ======='
  end
end
