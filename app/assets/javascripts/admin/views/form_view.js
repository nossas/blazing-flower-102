console.log('Loading admin/views/form_view.js');

var FormView = Backbone.View.extend({
  initialize: function(){
    this.model.bind('error', this.handleErrors);
  },

  handleErrors: function(model, errors){
    var that = this;
    $.each(errors, function(key, val){
      selector = '#' + that.getModelName() + '_' + key + '_errors';
      $(selector, that).html(val);
    });
  },

  getModelName: function(){
    return $(this.el).attr('id').split(/_form$/)[0];
  },

  persist: function(){
    var fields = {};
    _.reduce(this.$('[name^=' + this.getModelName() + '\\[]'), function(memo, el){
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
