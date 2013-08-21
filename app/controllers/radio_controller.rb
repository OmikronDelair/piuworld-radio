class RadioController < ApplicationController
  include ActionController::Live 
  require "net/http"
  require "uri"

  def index
  end

  def track_info
    track = Net::HTTP.get_response(URI.parse(StreamingService.status)).body
    StreamingService.response_garbage.each { |garbage| track = track.gsub(garbage, '') }

    if track.match("Stream OFF") || track.match("Server OFF")
      @php = "FUERA DEL AIRE"
    else
      @php = "Est\xC3\xA1s escuchando: #{track}".encode('ASCII-8BIT').force_encoding('UTF-8')
    end
  end

  def current_track
    track_info()
    response.headers['Content-Type'] = 'text/event-stream'
    response.stream.write "event: track_info\n"
    response.stream.write "data: #{JSON.dump(@php)}\n\n"
    sleep 5
  rescue IOError
    # Disconnected
  ensure
    response.stream.close
  end

end
