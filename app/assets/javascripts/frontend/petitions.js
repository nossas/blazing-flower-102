MR.petitions = {
  show : function(){
    //page initializer
    MR.petitions.loadTAF();
    MR.petitions.loadDonation();

    //set listeners
    $(window).bind('hashchange', MR.petitions.loadTAF);
    $(window).bind('hashchange', MR.petitions.loadDonation);

    $("form#new_petition_signature").validate({
      messages: {
        "member[first_name]": "Campo obrigatório",
        "member[last_name]": "Campo obrigatório",
        "petition_signature[comment]": "Não insira mais que 140 caracteres",
        "member[email]": {"required": "Campo obrigatório", "email": "E-mail inválido"}
      }
    });

    $("#member_email").change(function(){
      $('label.error.already_signed[for="member_email"]').hide();
      $('form input[type=submit]').removeClass('disabled').removeAttr('disabled');
      $.getJSON('/petition_signatures', {email: $(this).val(), petition_id: $('form').data('petition_id')})
      .success(function(data){
        if(data){
          $('form input[type=submit]').addClass('disabled').attr('disabled', 'disabled');
          $('form input#member_email').addClass('error');
          $('label.error.already_signed[for="member_email"]').css('display', 'block');
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
  },

  loadDonation: function(){
    if(window.location.hash == '#doe'){
      $('.take_action').load(window.location.pathname + '/donate');
    }
  },

  loadTAF: function(){
    if(window.location.hash == '#compartilhe'){
      $('.take_action').load(window.location.pathname + '/share')
    }
  }

}
