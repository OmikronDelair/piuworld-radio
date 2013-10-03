class SSE
  include ActionController::Live

  def initialize io
    @io = io
  end

  def stream event, data
    @io.headers['Content-Type'] = 'text/event-stream'
    @io.stream.write "event: #{event}\n"
    @io.stream.write "data: #{JSON.dump(data)}\n\n"
    sleep 5
  rescue IOError
    # Disconnected
  ensure
    @io.stream.close
  end
end
