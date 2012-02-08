$(document).ready(function(){
  $("form#new_petition_signature_with_facebook"). submit(function(){ _gaq.push(['_trackEvent', 'Assinatura', "Assinar Via Facebook"]); });
  $(".share_with_friends form").                  submit(function(){ _gaq.push(['_trackEvent', 'Share', "Postar no Mural do Amigo"]); });
  $("#services a.facebook_btn").                  click(function(){ _gaq.push(['_trackEvent', 'Login', "Facebook"]); });
  $("#services a.orkut_btn").                     click(function(){ _gaq.push(['_trackEvent', 'Login', "Orkut"]); });
  $("#services a.google_btn").                    click(function(){ _gaq.push(['_trackEvent', 'Login', "Google"]); });
  $("a#MR_login_link").                           click(function(){ _gaq.push(['_trackEvent', 'Login', "Meu Rio"]); });
});
