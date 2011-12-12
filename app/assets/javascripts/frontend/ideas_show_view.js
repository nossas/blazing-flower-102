MR.IdeasShowView = MR.EditableView.extend({
  initialize: function(){
    _.bindAll(this, 'fork');
    this.modelName = "idea";
    this.bindRoutes();
    this.loadLastFragment();
    this.prepareEditables();
  },

  bindRoutes: function(){
    MR.router.bind('route:fork', this.fork)
  },

  fork: function(){
    if(this.requireLogin()){
      $.facebox({div: '#confirm_fork_idea'});
    }
  },
});
