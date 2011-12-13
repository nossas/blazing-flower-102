MR.IdeasIndexView = MR.BaseView.extend({
  initialize: function(){
    var that = this;
    _.bindAll(this, 'newIdea', 'selectCategory');
    this.bindRoutes();
    this.loadLastFragment();
    $(document).bind('reveal.facebox', function(){
      MR.common.setUpDropDowns(that.selectCategory);

      $("#facebox form#new_idea").submit(function(){
        if($('option[selected=selected]', '#facebox #idea_idea_category_id').length < 1){
          $('#facebox label.error').removeClass('hidden');
          return false;
        }
        else{
          $('#facebox label.error').addClass('hidden');
          return true;
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

  selectCategory: function(params){
    $('option', '#facebox #idea_idea_category_id').removeAttr('selected');
    $('option[value=' + $(params).attr('href') + ']', '#facebox #idea_idea_category_id').attr('selected', 'selected');
  },

  newIdea: function(){
    if(this.requireLogin()){
      $.facebox({div: '#new_idea'});
    }
  },

});

