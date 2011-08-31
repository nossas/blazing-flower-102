MR.personal_stories = {
  issue_index: function(){
    var story,
        thumb,

    // Apply 'first' class to every 4th thumbnail
    $story = $('div.story');
    $story.each(function(){
      if ($story.index(this) % 4 === 0){
        $(this).addClass('first');
      }
    });
    
    $thumb = $('div.story a.thumbnail');
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
          $(this).children(".play_button").addClass('active');
        }
      }).mouseleave(function(){
        if($(this).hasClass('current') == false){
          $(this).children(".play_button").removeClass('active');
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
      if(window.location.pathname.match(/direto_da_gema\/\d+/)){
        history.pushState(videoData, '', clicked_story.id);
      } else {
        history.pushState(videoData, '', 'direto_da_gema/' + clicked_story.id);
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
      $('.comments_arrow').removeClass('hidden');
    } else if(data.connected_action == "PETITION"){
      $('.debate.btn').hide();
      $('.petition.btn').show();
      $('.comments_arrow').removeClass('hidden');
    } else {
      $('.take_action').hide();
      $('.comments_arrow').addClass('hidden');
    }
  },

  movePlayButton: function(thumb){
    $('.story .thumbnail').removeClass("current");
    //$('.play_button').removeClass("active");
    thumb.addClass("current");
    thumb.children(".play_button").show();
  }
}
