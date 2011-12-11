MR.IdeasShowView = MR.BaseView.extend({
  initialize: function(){
    _.bindAll(this, 'fork');
    _.bindAll(this, 'selectItem');
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
  },

  selectItem: function(){
    this.selectedItem = this.$('.menu a[href=#' + name + ']');
    this.$('.menu .selected').removeClass('selected');
    this.selectedItem.addClass('selected');
    this.$('.content > div').hide();
    this.$('.content .' + name).show();
  }

});
