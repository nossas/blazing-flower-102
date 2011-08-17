MR.personal_stories = {
  issue_index: function(){
    console.log("you're on the issue index page!");
    var $thumb = $('.story .thumbnail');

    $thumb.each(function(){
      var $this = $(this);
      $(this).bind('click', function(e){

        e.preventDefault();
        //check if current video is same as thumbnail
        if ($(this).attr('data-storyID') != $('#current_video').attr('data-storyID')){
          MR.personal_stories.getPersonalStory($this);
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
  },

  getPersonalStory: function(story){
    var clicked_story = _.first(_.select(MR.stories, function(video){return video.id == story.attr('data-storyid')}));
    MR.personal_stories.replaceVideo(clicked_story);

    MR.personal_stories.movePlayButton(story);
    if(Modernizr.history){
      // history management works!
      var videoData = {
        id : clicked_story.id,
        data: clicked_story
      }
      if(window.location.pathname.match(/personal_stories\/\d+/)){
        history.pushState(videoData, '', clicked_story.id);
      } else {
        history.pushState(videoData, '', 'personal_stories/' + clicked_story.id);
      }
    } else {
      // no history support :(
    }

  },

  replaceVideo: function(data){
    var $current_video = $('#current_video');
    var $current_title = $('#current_title');
    var $current_description = $('#current_description');

    $current_video.html(data.video_embed_code);
    $current_title.html(data.title);
    $current_description.html(data.description);
    $current_video.attr('data-storyID', data.id);

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

  movePlayButton: function(thumb){
    $('.story .thumbnail').removeClass("current");
    $('.play_button').hide();
    thumb.addClass("current");
    thumb.children(".play_button").show();
  }
}
