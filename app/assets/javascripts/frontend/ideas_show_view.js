MR.IdeasShowView = MR.EditableView.extend({
  initialize: function(){
    _.bindAll(this, 'fork', 'remove', 'description', 'versions', 'publish');
    this.modelName = "idea";
    this.bindRoutes();
    this.loadLastFragment();
    this.prepareEditables();
    $(document).bind('afterClose.facebox', function(){
      Backbone.history.navigate('');
    });
    this.description();
    
    //Binding the like event :)
    FB.Event.subscribe('edge.create', function(response) {
      var fburl = "https://api.facebook.com/method/fql.query?format=json&query=";
      var fbsql = fburl + encodeURI("SELECT like_count FROM link_stat WHERE url = '" + response + "'");
      $.getJSON(fbsql, function(data){
        var likes = 0;
        var updateUrl = $("meta[property='like_url']").attr('content');
        if (data.length) {
          likes = data[0].like_count;
          MR.common.updateIdeaLikes(updateUrl, likes);
        }
      });
    });
  },

  bindRoutes: function(){
    MR.router.bind('route:fork', this.fork);
    MR.router.bind('route:remove', this.remove);
    MR.router.bind('route:description', this.description);
    MR.router.bind('route:versions', this.versions);
    MR.router.bind('route:publish', this.publish);
  },

  publish: function(){
    var that = this;
    var path = '/imagine/ideas/' + this.$('#idea_head').data('id') + '/publish';
    $.ajax({
      type: "PUT",
      url: path,
      success: function(data){
        that.$('.publish_idea.btn').remove();
        $.facebox({div: '#thanks_for_publishing'});
      },
      error: function(data){
      }
    });
  },

  versions: function(){
    this.$('a[href="#versions"]').parent().addClass('selected')
    this.$('a[href="#description"]').parent().removeClass('selected')
    this.$('#idea_description').hide();
    this.$('#idea_versions').show();
  },

  description: function(){
    this.$('a[href="#versions"]').parent().removeClass('selected')
    this.$('a[href="#description"]').parent().addClass('selected')
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
