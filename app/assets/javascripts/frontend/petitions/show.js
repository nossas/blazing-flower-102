$("form#new_petition_signature").validate({
  messages: {
    "member[first_name]": "Campo obrigatório",
    "member[last_name]": "Campo obrigatório",
    "petition_signature[comment]": "Não insira mais que 140 caracteres",
    "member[email]": {"required": "Campo obrigatório", "email": "E-mail inválido"}
  }
});

$("#petition_signature_comment").keyup(function(){
  $("#comment_tip").html((140 - $("#petition_signature_comment").val().length) + " caracteres");
});

$('.take_action').bind('ajax:success', function(event, data){
  $('.take_action').html(data);
});

$('#submit_btn').click(function(){
  if($("form#new_petition_signature").valid()){
    $("#loader").show();
    $('#submit_btn').hide();
  }
});
