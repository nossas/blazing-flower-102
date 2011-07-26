$(document).ready(function(){

  var $new_comment = $('#new_comment');
  var $form = $("form#new_comment");
  var $submitButton = $form.find('input[name="commit"]');

  var page = 2;
  var debate = $("h1.grid_12").attr("data-debate");

  //show and hide comment box
  $new_comment.hide();

  $('#join_the_conversation').bind('click', function(e){
    $new_comment.show(); 
  });

  $('#close').bind('click', function(){
    $new_comment.hide(); 
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

});
