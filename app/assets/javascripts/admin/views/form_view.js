var FormView = Backbone.View.extend({
  persist: function(){
    var fields = {};
    _.reduce(this.$('[name^=' + $(this.el).attr('id').split(/_form$/)[0] + '\\[]'), function(memo, el){
      var field = $(el);
      var key = field.attr('name').match(/\[(.*)\]/)[1];
      var value = field.val();
      memo[key] = value;
      return memo;
    }, fields);
    this.model.set(fields);
    return this;
  }
});
