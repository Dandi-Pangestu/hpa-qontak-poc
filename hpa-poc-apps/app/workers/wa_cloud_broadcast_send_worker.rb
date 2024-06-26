class WaCloudBroadcastSendWorker
  include Sidekiq::Job

  sidekiq_options queue: :wa_cloud_broadcast_send

  def perform(server_id, params)
    p '======= START WA CLOUD BROADCAST SEND WORKER ======='
    sleep_interval = rand((0.3)..(1.0))
    p "----- Sleep with #{sleep_interval}s -----"
    p server_id
    p params
    sleep(sleep_interval)
    p '======= FINISH WA CLOUD BROADCAST SEND WORKER ======='
  end
end
