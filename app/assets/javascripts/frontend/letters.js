// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  function validateForm(){
    if($("#letter_sender").val() != "" && $("#letter_email").val() != ""){
      $(".new_letter input[type='submit']").removeAttr("disabled")
    }
  }

  $(".new_letter input[type='submit']").attr("disabled", true);
  $("#letter_sender").change(validateForm);
  $("#letter_email").change(validateForm);
});
