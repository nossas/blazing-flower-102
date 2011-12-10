MR.IdeasShowView = MR.BaseView.extend({
  initialize: function(){
    this.bindRoutes();
  },

  bindRoutes: function(){
    MR.router.bind('route:fork', this.fork)
  },

  fork: function(){
    $.facebox({div: '#confirm_fork_idea'});
  }
});
