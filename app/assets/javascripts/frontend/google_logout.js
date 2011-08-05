$(function(){
  $('iframe#google_logout_iframe').load(function(){
    window.location.href = "/logout";
  });
});
