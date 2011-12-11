MR.IdeasShowView = MR.BaseView.extend({
  initialize: function(){
    _.bindAll(this, 'fork');
    this.bindRoutes();
    this.loadLastFragment();
  },

  bindRoutes: function(){
    MR.router.bind('route:fork', this.fork)
  },

  fork: function(){
    if(this.requireLogin()){
      $.facebox({div: '#confirm_fork_idea'});
    }
  }
});
