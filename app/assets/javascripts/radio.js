this.source = new EventSource('/radio/current_track');

this.source.addEventListener('track_info', function(e){
  $('.track-info').text(e.data.split('"')[1]);
});

