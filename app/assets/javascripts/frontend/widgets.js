MR.widgets = {
  legislative: function(){
    this.find('.scrollable .items .item').each(function(){
      $(this).prepend(
        $('<div>')
          .append($('<span>').addClass('month').html($(this).data('month')))
          .append($('<span>').addClass('day').html($(this).data('day')))
      );
    });
    this.find('.scrollable')
      .scrollable({circular: true})
      .autoscroll({autoplay: false});

    MR.widgets.legislative.api = this.find('.scrollable').scrollable();
  }
}
