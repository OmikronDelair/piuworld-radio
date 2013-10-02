class RadioController < ApplicationController

  def index
  end

  def server_status
    @stream = StreamingStatus.new(response)
    @stream.stream_status
  end

end
