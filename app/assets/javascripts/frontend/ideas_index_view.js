MR.IdeasIndexView = MR.BaseView.extend({
  initialize: function(){
    _.bindAll(this, 'newIdea');
    this.bindRoutes();
    this.loadLastFragment();
  },

  bindRoutes: function(){
    MR.router.bind('route:new_idea', this.newIdea)
  },

  newIdea: function(){
    if(this.requireLogin()){
      $.facebox({div: '#new_idea'});
    }
  },

});

