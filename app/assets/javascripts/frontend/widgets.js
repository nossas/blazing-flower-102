MR.widgets = {
  /*
  * Each function is called when we find a .widget element with 
  * a corresponding id in the homepage
  * (for example: an element <div class="widget" id="legislative"> calls the legislative function on initialization)
  */
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
