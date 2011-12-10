MR.BaseView = Backbone.View.extend({
  el: 'body',
  isLoggedIn: function(){
    return this.$('#member_panel .flyout').length > 0;
  },

  loginDialog: function(){
    $.facebox({div: '#login'});
  }
});
