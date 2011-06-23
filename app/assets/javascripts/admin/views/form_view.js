console.log('Loading admin/views/form_view.js');

var FormView = Backbone.View.extend({
  events: {
    'click [type="submit"]' : 'save'
  },

  initialize: function(){
    _.bindAll(this, 'handleErrors');
    this.model.bind('error', this.handleErrors);
  },

  save: function(){
    this.persist();
    this.model.save();
    return false;
  },

  handleErrors: function(model, errors, third){
    var that = this;
    if(errors.responseText){
      errors = JSON.parse(errors.responseText);
    }
    $.each(errors, function(key, val){
      var selector = '#' + that.getModelName() + '_' + key + '_errors';
      that.$(selector).html(val.join(', '));
    });
  },

  getModelName: function(){
    return $(this.el).attr('id').split(/_form$/)[0];
  },

  persist: function(){
    var fields = {};
    var modelName = this.getModelName();
    _.reduce(this.$('[name^=' + modelName + '\\[]'), function(memo, el){
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
