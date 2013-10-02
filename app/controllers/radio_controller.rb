class RadioController < ApplicationController
  before_action :authenticate_user!, only: [:control_panel]

  def index
  end

  def server_status
    @stream = StreamingStatus.new(response)
    @stream.stream_status
  end

  def control_panel
    @io ||= ServerIO.new

    if params[:server_status] == "ON"
      @io.start_server
      redirect_to control_panel_radio_index_path
    elsif params[:server_status] == "OFF"
      @io.stop_server
      redirect_to control_panel_radio_index_path
    end
  end

end
