$(document).ready(function(){

  var $thumb = $('.story .thumbnail');

  $thumb.each(function(){
    var $this = $(this);
    $(this).bind('click', function(e){

      e.preventDefault();
      //check if current video is same as thumbnail
      if ($(this).attr('data-storyID') != $('#current_video').attr('data-storyID')){
        PersonalStory.getPersonalStory($this);
      }
    }).mouseenter(function(){
      if($(this).hasClass('current') == false){
        $(this).children(".play_button").show();
      }
    }).mouseleave(function(){
      if($(this).hasClass('current') == false){
        $(this).children(".play_button").hide();
      }
    });
  });

});

var PersonalStory ={

  getPersonalStory : function(story){
    $.ajax({
      url: '/personal_stories/' + story.attr('data-storyID'),
      type: 'GET',
      dataType: 'json',
      success: function(data){
        PersonalStory.replaceVideo(data);
        PersonalStory.movePlayButton(story);
        if(Modernizr.history){
          // history management works!
          var videoData = {
            id : data.id,
            data: data
          }
          if(window.location.pathname.match(/personal-stories\/\d+/)){
            history.pushState(videoData, '', data.id);
          } else {
            history.pushState(videoData, '', 'personal-stories/' + data.id);
          }
        } else {
          // no history support :(
        }
      },
      error: function(xhr, status){
      }
    }); 
  },

  replaceVideo : function(data){
    var $current_video = $('#current_video');
    var $current_title = $('#current_title');
    var $current_description = $('#current_description');

    $current_video.html(data.video_embed_code);
    $current_title.html(data.title);
    $current_description.html(data.description);
    $current_video.attr('data-storyID', data.id);
    $('.story .thumbnail').removeClass("current");

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

  movePlayButton : function(thumb){
    thumb.addClass("current");
    thumb.children(".play_button").show();
  }
}
