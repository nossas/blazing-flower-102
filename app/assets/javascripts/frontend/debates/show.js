$(document).ready(function(){

  var $new_comment = $('#new_comment');
  var $form = $("form#new_comment");
  var $submitButton = $form.find('input[name="commit"]');

  var page = 2;
  var debate = $("h1.grid_12").attr("data-debate");

  //show and hide comment box
  $new_comment.hide();

  $(window).bind('hashchange', function(){
    if(window.location.hash == '#new_comment'){
      $new_comment.show(); 
      $("#bottom_buttons").hide();
    }
  });

  $('#close').bind('click', function(){
    window.location.hash = 'comments_bottom';
    $('#comment_content').val('');
    $new_comment.hide(); 
    $("#bottom_buttons").show();
  });

  //comment submissision and validation
  $form.validate({
    messages: {
      "comment[content]": "Please enter a comment!"
    }
  });

  $submitButton.bind('click', function(){
    if($form.valid()){
      $submitButton.data( 'origText', $(this).val());
      $submitButton.val( "Submitting...");
    }
  });

  $form.bind("ajax:success", function(evt, data, status, xhr){
      $form.find('textarea').val("");
      $('.previous_comments').append(data);
      $comment_count = $('.comments_tooltip');
      $comment_count.text(parseInt($comment_count.text()) + 1);
    }).bind("ajax:complete", function(evt, xhr, status){
      $submitButton.val($submitButton.data('origText'));
    }).bind("ajax:error", function(evt, xhr, status, error){
      $form.prepend("There were errors with the the submission. Please reload the page and try again.");
    });

    //load more comments via ajax

    $load_more = $("#load_more");
    
    $load_more.bind('click', function(e){
      $load_more.data('origText', $(this).html());
      $load_more.html( "Loading..." );
      $.ajax({
          url: '/debates/' + debate + '/load_comments/' + page,
          type: 'GET',
          dataType: 'html',
          success: function(data){
            if (data){
              page++;
              $('.previous_comments').append(data);
              $load_more.html($load_more.data('origText'));
            } else {
              $load_more.html("No more comments to load");  
            };
          },
          error: function(xhr, status){
            $load_more.html("There's been an error. Please reload the page.");
          }
      });
    });

    $('.flag').bind('ajax:success', function(event, data){
        $(this).show();
        $("#flag_loading").hide();
        var link = $(this);
        if(link.data("method") == "post"){
          link.html(unflag_label).data("method", "delete").attr("href", link.attr("href") + "/" + data.id);
        }
        else{
          var path_array = link.attr("href").split("/");
          var path = path_array.slice(0, (path_array.length - 1)).join("/");
          link.html(flag_label).data("method", "post").attr("href", path);
        }
    });

    $(".flag").bind("click", function(){
        $(this).hide();
        $("#flag_loading").show();

    });
});
