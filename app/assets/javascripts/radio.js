if(this.location.pathname == "/") {

  this.source = new EventSource('/radio/server_status');

  this.source.addEventListener('streaming_status', function(e){
      $('.track-info').text(e.data.split('"')[1]);
  });

};
