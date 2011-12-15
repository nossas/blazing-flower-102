MR.IdeasIndexView = MR.BaseView.extend({
  initialize: function(){
    var that = this;
    _.bindAll(this, 'newIdea', 'selectOption', 'searchCategory');
    this.bindRoutes();
    this.loadLastFragment();
    $("form[name=search_category] input[type=radio]").click(function(){
      MR.common.searchCategoryId($(this).val());
    });
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
    MR.router.bind('route:search_category', this.searchCategory)
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

  searchCategory: function(params){
    var id = parseInt(params);
    var target = $('.ideas_list .ideas ul');
    if ( id == 0 ){
      target.children('li[data-category]').fadeIn("slow");
    } else {
      target.children('li[data-category]').hide();
      target.children('li[data-category=' + id + ']').fadeIn("slow");
    }
  }
});

