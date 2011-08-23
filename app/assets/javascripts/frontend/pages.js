MR.pages = {
  show: function(){
    MR.pages.initializeWidgets();
  },

  initializeWidgets: function(){
    $('.widget').each(function(){
      var widgetName = $(this).attr('id');
      if(MR.widgets[widgetName]){
        MR.widgets[widgetName].apply($(this));
      }
    });
  }
}

