$(document).ready(function(){
  $("#new_petition_signature_with_facebook"). submit(function(){ _gaq.push(['_trackEvent', 'Assinatura', "Assinar Via Facebook"]); });
  $(".share_with_friends form").              submit(function(){ _gaq.push(['_trackEvent', 'Share', "Postar no Mural do Amigo"]); });
  $("#services .facebook_btn").               submit(function(){ _gaq.push(['_trackEvent', 'Login', "Facebook"]); });
  $("#services .orkut_btn").                  submit(function(){ _gaq.push(['_trackEvent', 'Login', "Orkut"]); });
  $("#services .google_btn").                 submit(function(){ _gaq.push(['_trackEvent', 'Login', "Google"]); });
  $("#MR_login_link").                        submit(function(){ _gaq.push(['_trackEvent', 'Login', "Meu Rio"]); });
});
