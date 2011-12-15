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
          '#facebox #idea_idea_help_method',
        ];
        for (field in fields){

          if($('option[selected=selected]', $fields[field]).length === 0){
            $(this).parent().siblings('label.error').removeClass('hidden');
            return false;

          } else {
            $(this).parent().siblings('label.erro').addClass('hidden');
            return true;
          }
        }
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

