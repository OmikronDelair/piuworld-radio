PWR.Router = Backbone.Router.extend ({
  routes: {
    '' : 'mainPage'
  },

  mainPage: function(){
    this.mainView = new PWR.Views.mainPage();
  }
})
