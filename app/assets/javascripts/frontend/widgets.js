MR.widgets = {
  /*
  * Each function is called when we find a .widget element with 
  * a corresponding id in the homepage
  * (for example: an element <div class="widget" id="legislative"> calls the legislative function on initialization)
  */
  legislative: function(){
    this.find('.scrollable .items .item').each(function(){
      $(this).prepend(
        $('<div>').addClass('date')
          .append($('<span>').addClass('month').html($(this).data('month')))
          .append($('<span>').addClass('day').html($(this).data('day')))
      );
    });

    MR.widgets.legislative.api = MR.widgets.createScrollable.apply(this);
  },

  public_hearings: function(){
    MR.widgets.public_hearings.api = MR.widgets.createScrollable.apply(this);
  },

  createScrollable: function(){
    this.find('.scrollable')
      .scrollable({circular: true});

    // Ensure that the URL is not appended with a #
    this.find('.controls a').click(function(){return false;});

    if(this.find('.scrollable .item').length < 4){
      this.find('.controls').hide();
    } 
    return this.find('.scrollable').scrollable();
  }
}
