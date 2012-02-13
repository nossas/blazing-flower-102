$(document).ready(function(){
  $("form#new_petition_signature_with_facebook").                     submit(function(){ _gaq.push(['_trackEvent', 'Assinatura', "Assinar Via Facebook"]); });
  $(".share_with_friends form").                                      submit(function(){ _gaq.push(['_trackEvent', 'Share', "Postar no Mural do Amigo"]); });
  $("a[rel=facebox]").click(function(){$("#services a.facebook_btn"). click(function(){ _gaq.push(['_trackEvent', 'Login', "Facebook"]); });
  $("a[rel=facebox]").click(function(){$("#services a.orkut_btn").    click(function(){ _gaq.push(['_trackEvent', 'Login', "Orkut"]); });
  $("a[rel=facebox]").click(function(){$("#services a.google_btn").   click(function(){ _gaq.push(['_trackEvent', 'Login', "Google"]); });
  $("a[rel=facebox]").click(function(){$("a#MR_login_link").          click(function(){ _gaq.push(['_trackEvent', 'Login', "Meu Rio"]); });
  $("#meu_rio_is a.prev").                                            click(function(){ _gaq.push(['_trackEvent', 'Home', "Ver o Membro Anterior"]); });
  $("#meu_rio_is a.next").                                            click(function(){ _gaq.push(['_trackEvent', 'Home', "Ver o Próximo Membro"]); });
  $("#team_update a").                                                click(function(){ _gaq.push(['_trackEvent', 'Home', "Ir para o Blog"]); });
  $("#twitter_widget a.name").                                        click(function(){ _gaq.push(['_trackEvent', 'Home', "Ir para o Twitter"]); });
  $("#join_widget a.btn").                                            click(function(){ _gaq.push(['_trackEvent', 'Home', "Junte-se a Nós!"]); });
  $("#featured_content_1 a").                                         click(function(){ _gaq.push(['_trackEvent', 'Home', "Banner 1"]); });
  $("#featured_content_2 a").                                         click(function(){ _gaq.push(['_trackEvent', 'Home', "Banner 2"]); });
});
