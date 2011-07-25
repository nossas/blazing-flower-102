$(document).ready(function(){

  var $form = $("form#new_comment");
  var $submitButton = $form.find('input[name="commit"]');

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
      $('.comments').append(data);
      $comment_count = $('.comments_tooltip');
      $comment_count.text(parseInt($comment_count.text()) + 1);
    }).bind("ajax:complete", function(evt, xhr, status){
      $submitButton.val($submitButton.data('origText'));
    }).bind("ajax:error", function(evt, xhr, status, error){
      $form.prepend("There were errors with the the submission. Please reload the page and try again.");
    });

});
