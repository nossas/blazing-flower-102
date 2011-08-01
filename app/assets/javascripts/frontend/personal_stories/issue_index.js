$(document).ready(function(){

  var $current_video = $('#current_video');
  var $current_title = $('#current_title');
  var $current_description = $('#current_description');
  var $thumb = $('.story .thumbnail');
  var videoData;

  $thumb.each(function(){
    var $this = $(this);
    $(this).bind('click', function(e){

      e.preventDefault();
      //check if current video is same as thumbnail
      if ($(this).attr('data-storyID') != $current_video.attr('data-storyID')){
        getPersonalStory($this);
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

  window.setTimeout(function() {
    window.addEventListener("popstate", function(e) {
      if(e.state && e.state.data && Modernizr.history){
        replaceVideo(e.state.data); 
        movePlayButton(e.state.thumb);
      }
    }, false);
  }, 1);
  
  function getPersonalStory(story){
    $.ajax({
      url: '/personal_stories/' + story.attr('data-storyID'),
      type: 'GET',
      dataType: 'json',
      success: function(data){
        replaceVideo(data);
        movePlayButton(story);
        if (Modernizr.history) {
          // history management works!
          videoData = {
            id : data.id,
            data: data,
            thumb: story
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
  }

  function replaceVideo(data){
    $current_video.html(data.video_embed_code);
    $current_title.html(data.title);
    $current_description.html(data.description);
    $current_video.attr('data-storyID', data.id);
    $thumb.removeClass("current");

    if(data.connected_action == "DEBATE"){
      $('.petition.btn').hide();
      $('.debate.btn').show();
    } else if(data.connected_action == "PETITION"){
      $('.debate.btn').hide();
      $('.petition.btn').show();
    } else {
      $('.take_action').hide();
    }
  }

  function movePlayButton(thumb){
    thumb.addClass("current");
    thumb.children(".play_button").show();
  }
});


