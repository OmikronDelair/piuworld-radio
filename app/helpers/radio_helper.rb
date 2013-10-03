module RadioHelper

  def io_button
    if @io.check_io_status == "Servidor apagado"
      link_to "Encender", djs_control_panel_path(server_status: "ON")
    else
      link_to "Apagar", djs_control_panel_path(server_status: "OFF")
    end
  end

end
