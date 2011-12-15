MR.IdeasIndexView = MR.BaseView.extend({
  initialize: function(){
    var that = this;
    _.bindAll(this, 'newIdea', 'selectOption');
    this.bindRoutes();
    this.loadLastFragment();

    $(document).bind('reveal.facebox', function(){
      MR.common.setUpDropDowns(that.selectOption);
      $("#facebox form#new_idea").submit(function(){
        var fields = [
          '#facebox #idea_idea_category_id',
          '#facebox #idea_idea_help_method_id',
        ];
        var valid = true
        _.each(fields, function(field){
          var label = $(field).parents('form').find('label.error[data-for=' + $(field).attr('id') + ']');
          if($('option[selected=selected]', field).length === 0){
            label.removeClass('hidden');
            valid = false;
          } else {
            label.addClass('hidden');
          }
        });
        return valid;
      });
    });
    $(document).bind('afterClose.facebox', function(){
      Backbone.history.navigate('');
    });
  },

  bindRoutes: function(){
    MR.router.bind('route:new_idea', this.newIdea)
  },

  selectOption: function(params){
    $('option', '#facebox #' + $(params).attr('data-param')).removeAttr('selected');
    $('option[value=' + $(params).attr('href') + ']', '#facebox #' + $(params).attr('data-param')).attr('selected', 'selected');
  },

  newIdea: function(){
    if(this.requireLogin()){
      $.facebox({div: '#new_idea'});
    }
  },

});

