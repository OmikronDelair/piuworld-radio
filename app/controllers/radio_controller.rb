class RadioController < ApplicationController
  before_action :authenticate_user!, only: [:control_panel]

  def index
  end

  def server_status
    status = StreamingStatus.new.retrieve_status
    sse = SSE.new(response)
    sse.stream('streaming_status', status)
  end

  def control_panel
    @io ||= ServerIO.new

    if params[:server_status] == "ON"
      @io.start_server
      redirect_to djs_control_panel_path
    elsif params[:server_status] == "OFF"
      @io.stop_server
      redirect_to djs_control_panel_path
    end
  end

end
