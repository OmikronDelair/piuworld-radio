module RadioHelper

  def io_button
    if @io.check_io_status == "Servidor apagado"
      link_to "Encender", control_panel_radio_index_path(server_status: "ON")
    else
      link_to "Apagar", control_panel_radio_index_path(server_status: "OFF")
    end
  end

end
