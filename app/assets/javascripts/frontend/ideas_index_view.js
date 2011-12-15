MR.IdeasIndexView = MR.BaseView.extend({
  initialize: function(){
    var that = this;
    _.bindAll(this, 'newIdea', 'selectOption');
    this.bindRoutes();
    this.loadLastFragment();

    $(document).bind('reveal.facebox', function(){
      MR.common.setUpDropDowns(that.selectOption);
      $("#facebox form#new_idea").submit(function(){
        var error = {};
        $('#facebox form#new_idea select').each(function(){
          var label = $('label.error[data-for=' + $(this).attr('id') + ']');
          var option = $(this).children('option:selected');
          if (option.length == 0 || option.val() == ""){
            label.removeClass('hidden');
            error[$(this).attr('id')] = true;
          } else {
            label.addClass('hidden');
            delete error[$(this).attr('id')];
          }
        });
        var c = 0;
        for (i in error) { c++ };
        if (c == 0) {
          $(this).submit();
        } else {
          return false;
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

