$("form#new_petition_signature").validate({
  messages: {
    "member[first_name]": "Campo obrigatório",
    "member[last_name]": "Campo obrigatório",
    "petition_signature[comment]": "Não insira mais que 140 caracteres",
    "member[email]": {"required": "Campo obrigatório", "email": "E-mail inválido"}
  }
});

$("#member_email").change(function(){
  $('form input[type=submit]').removeClass('disabled').removeAttr('disabled');
  $.getJSON('/petition_signatures', {email: $(this).val(), petition_id: $('form').data('petition_id')})
  .success(function(data){
    if(data){
      $('form input[type=submit]').addClass('disabled').attr('disabled', 'disabled');
      $('form input#member_email').addClass('error');
      if($('label.error[for="member_email"]').length == 0){
        $('form input#member_email').after($('<label>').attr('for', 'member_email').attr('generated', 'true').addClass('error'));
      }
      $('label.error[for="member_email"]').html('Você já assinou esta petição.').show();
    }
  });
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
