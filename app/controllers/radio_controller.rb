class RadioController < ApplicationController
  include ActionController::Live 
  require "net/http"
  require "uri"

  SERVER = URI.parse("http://cp.freeshoutcast.com/scripts/song2.php?port=40842&host=s3")
  GARBAGE = "\n<style type='text/css'>\nhtml, body, div, span, applet, object, iframe,\nh1, h2, h3, h4, h5, h6, p, blockquote, pre,\na, abbr, acronym, address, big, cite, code,\ndel, dfn, em, font, img, ins, kbd, q, s, samp,\nsmall, strike, strong, sub, sup, tt, var,\ndl, dt, dd, ol, ul, li,\nfieldset, form, label, legend,\ntable, caption, tbody, tfoot, thead, tr, th, td {\n\tmargin: 0;\n\tpadding: 0;\n\tborder: 0;\n\toutline: 0;\n}\n</style>\n<meta content='text/html; charset=utf-8' http-equiv='content-type' />\n<META HTTP-EQUIV='Refresh' CONTENT='30;'>\n\n"

  def index
  end

  def track_info
    track = Net::HTTP.get_response(SERVER).body.gsub(GARBAGE,"").gsub("<font color='black'>","").gsub("</font>","").gsub("\n","")
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
