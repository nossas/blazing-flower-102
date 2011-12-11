MR.BaseView = Backbone.View.extend({
  el: $('body'),
  isLoggedIn: function(){
    return this.$('#member_panel .flyout').length > 0;
  },

  getStore: function(){
    if(!this.store){
      this.store = new Store('view');
    }
    return this.store;
  },

  loadLastFragment: function(){
    var fragment = this.getStore().get('lastFragment');
    if(fragment){
      this.store.remove('lastFragment');
      Backbone.history.navigate(fragment);
    }
  },

  requireLogin: function(){
    if(this.isLoggedIn()){
      return true;
    }
    else{
      this.getStore().set('lastFragment', Backbone.history.getFragment());
      this.loginDialog();
      return false;
    }
  },

  loginDialog: function(){
    $.facebox({div: '#login'});
  }
});
