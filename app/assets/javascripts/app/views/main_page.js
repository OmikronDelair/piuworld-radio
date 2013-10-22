PWR.Views.mainPage = Backbone.View.extend ({
  el: 'body',

  initialize: function(){
    this.source = new EventSource('/radio/server_status');
    var self = this

    this.source.addEventListener('streaming_status', function(e){
      $(self.$el).find('.track-info').text(e.data.split('"')[1]);
    });
  }
})
