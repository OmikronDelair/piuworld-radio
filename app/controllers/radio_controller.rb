class RadioController < ApplicationController
  include ActionController::Live 
  require "net/http"
  require "uri"

  def index
  end

  def current_track
    get_current_track track_info
  end

  private

  def track_info
    track = Net::HTTP.get_response(URI.parse(StreamingService.status)).body
    StreamingService.response_garbage.each { |garbage| track = track.gsub(garbage, '') }

    if track.match("Stream OFF") || track.match("Server OFF")
      @php = "FUERA DEL AIRE"
    else
      @php = "Est\xC3\xA1s escuchando: #{track}".encode('ASCII-8BIT').force_encoding('UTF-8')
    end
  end

  def get_current_track track
    response.headers['Content-Type'] = 'text/event-stream'
    response.stream.write "event: track_info\n"
    response.stream.write "data: #{JSON.dump(track)}\n\n"
    sleep 5
  rescue IOError
    # Disconnected
  ensure
    response.stream.close
  end

end
