$(document).ready(function(){

  var $current_video = $('#current_video');
  var $current_title = $('#current_title');
  var $current_description = $('#current_description');
  var $thumb = $('.story .thumbnail');

  $thumb.mouseenter(function(){
    if($(this).hasClass('current') == false){
      $(this).children(".play_button").show();
    }
  }).mouseleave(function(){
    if($(this).hasClass('current') == false){
      $(this).children(".play_button").hide();
    }
  });


  $thumb.each(function(){
    var $this = $(this);
    $(this).bind('click', function(){
      //check if current video is same as thumbnail
      if ($(this).attr('data-storyID') != $current_video.attr('data-storyID')){
        $.ajax({
          url: '/personal_stories/' + $(this).attr('data-storyID'),
          type: 'GET',
          dataType: 'json',
          success: function(data){
            $current_video.html(data.video_embed_code);
            $current_title.html(data.title);
            $current_description.html(data.description);
            $current_video.attr('data-storyID', data.id);
            $thumb.removeClass("current");
            $this.addClass("current");
            $this.children(".play_button").show();
            if(data.connected_action == "DEBATE"){
              $('.petition.btn').hide();
              $('.debate.btn').show();
            } else if(data.connected_action == "PETITION"){
              $('.debate.btn').hide();
              $('.petition.btn').show();
            } else {
              $('.take_action').hide();
            }
          },
          error: function(xhr, status){
          }
        }); 
      }
    });
  });

});
