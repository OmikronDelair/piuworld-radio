class StreamingStatus
  require "net/http"
  require "uri"

  def retrieve_status
    status = Net::HTTP.get_response(URI.parse(StreamingService.status)).body
    StreamingService.response_garbage.each {|garbage| status = status.gsub(garbage,'')}

    if status.match("Stream OFF") || status.match("Server OFF")
      @php = "FUERA DEL AIRE"
    else
      @php = "Est\xC3\xA1s escuchando: #{status}".encode('ASCII-8BIT').force_encoding('UTF-8')
    end
  end

end
