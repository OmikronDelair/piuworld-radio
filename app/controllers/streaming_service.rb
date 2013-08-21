class StreamingService < Settingslogic
  source "#{Rails.root}/config/streaming_service.yml"
  namespace Rails.env
end
