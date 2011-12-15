MR.IdeasShowView = MR.EditableView.extend({
  initialize: function(){
    _.bindAll(this, 'fork', 'remove', 'description', 'versions');
    this.modelName = "idea";
    this.bindRoutes();
    this.loadLastFragment();
    this.prepareEditables();
    $(document).bind('afterClose.facebox', function(){
      Backbone.history.navigate('');
    });
    this.description();
  },

  bindRoutes: function(){
    MR.router.bind('route:fork', this.fork)
    MR.router.bind('route:remove', this.remove)
    MR.router.bind('route:description', this.description)
    MR.router.bind('route:versions', this.versions)
  },
  
  versions: function(){
    this.$('#idea_description').hide();
    this.$('#idea_versions').show();
  },

  description: function(){
    this.$('#idea_description').show();
    this.$('#idea_versions').hide();
  },

  fork: function(){
    if(this.requireLogin()){
      $.facebox({div: '#confirm_fork_idea'});
    }
  },

  remove: function(){
    if(this.requireLogin()){
      $.facebox({ div: "#remove_idea" });
    }
  }
});
