MR.BaseView = Backbone.View.extend({
  el: $('body'),
  isLoggedIn: function(){
    return this.$('#member_panel .flyout').length > 0;
  },

  requireLogin: function(){
    if(this.isLoggedIn()){
      return true;
    }
    else{
      this.loginDialog();
      return false;
    }
  },

  loginDialog: function(){
    $.facebox({div: '#login'});
  }
});
