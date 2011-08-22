MR.pages = {
  show: function(){
    MR.pages.initializeWidgets('legislative');
  },

  initializeWidgets: function(){
    $.each(arguments, function(i, el){
      if($('#' + el).length > 0){
        MR.widgets[el].apply($('#' + el));
      }
    });
  }
}

