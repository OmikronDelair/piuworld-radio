this.source = new EventSource('/radio/current_track');

this.source.addEventListener('track_info', function(e){
  console.log($.parseJSON(e.data));
});

