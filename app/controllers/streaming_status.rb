class StreamingStatus
  include ActionController::Live
  require "net/http"
  require "uri"

  def initialize io
   @io = io
  end

  def retrieve_status
    status = Net::HTTP.get_response(URI.parse(StreamingService.status)).body
    StreamingService.response_garbage.each {|garbage| status = status.gsub(garbage,'')}

    if status.match("Stream OFF") || status.match("Server OFF")
      @php = "FUERA DEL AIRE"
    else
      @php = "Est\xC3\xA1s escuchando: #{status}".encode('ASCII-8BIT').force_encoding('UTF-8')
    end
  end

  def stream_status
    status = retrieve_status
    @io.headers['Content-Type'] = 'text/event-stream'
    @io.stream.write "event: streaming_status\n"
    @io.stream.write "data: #{JSON.dump(status)}\n\n"
    sleep 5
  rescue IOError
    # Disconnected
  ensure
    @io.stream.close
  end
end
