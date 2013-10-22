var PWR = {
  Views: {},
  initialize: function(){
    PWR.router = new PWR.Router();
    Backbone.history.start();
  }
}
