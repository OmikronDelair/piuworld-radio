class ServerIO

  def initialize
    @agent = Mechanize.new
    @agent.user_agent_alias = "Mac FireFox"
    @agent.follow_meta_refresh = true

    page = @agent.get("http://cp.freeshoutcast.com/login.php")

    form = page.forms.first
    form.username = StreamingService.username
    form.user_password = StreamingService.user_password
    @admin_panel = form.click_button
  end

  def check_io_status
    if @admin_panel.body.match("Server: <font color='green'><b>ON</b></font>").nil?
      "Servidor apagado"
    else
      "Servidor encendido"
    end
  end

  def start_server
    @server_page = @agent.click(@admin_panel.link_with(text: "Your SHOUTcast"))
    @agent.get(@server_page.link_with(text: "Start").href+"ed")
  end

  def stop_server
    @server_page = @agent.click(@admin_panel.link_with(text: "Your SHOUTcast"))
    @agent.click(@server_page.link_with(text: "Stop"))
  end

end
