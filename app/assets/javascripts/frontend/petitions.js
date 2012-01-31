MR.petitions = {
  show : function(){
    //page initializer
    MR.petitions.loadTAF();
    MR.petitions.loadDonation();
    MR.common.setUpDropDowns(MR.petitions.runThese);
    $('label.error.already_signed[for="member_email"]').hide();

    //set listeners
    $(window).bind('hashchange', MR.petitions.loadTAF);
    $(window).bind('hashchange', MR.petitions.loadDonation);
    $('#member_email').change(MR.petitions.check_for_existing_signature_by_email);
    $('#new_petition_signature').submit(MR.petitions.handle_signature_submit);

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

    $("#new_petition_signature_with_facebook small").hide();
    $("#new_petition_signature_with_facebook input[type=submit]").mouseover(function(){ $("#new_petition_signature_with_facebook small").slideDown(); });
    $("#new_petition_signature_with_facebook input[type=submit]").mouseout(function(){ $("#new_petition_signature_with_facebook small").slideUp(); });
    $("#new_petition_signature_with_facebook input[type=submit]").click(function(){ _gaq.push(['_trackEvent', 'Login', "Assine Via Facebook"]); });

    $('.share_with_friends form textarea').autoResize({extraSpace: 0});
    $('.share_with_friends form .share_fields').hide();
    $('.share_with_friends form .share_fields:first').show();
    $('.share_with_friends form .share_fields img').hide();
    $('.share_with_friends form').mouseover(function(){ $('.share_fields', this).show() });
    $('.share_with_friends form').mouseout(function(){ if(!$('textarea', this).is(':focus')) { $('.share_fields', this).hide() }});
    $('.share_with_friends form').bind('ajax:complete', function() { $(this).remove(); });
    $('.share_with_friends form input[type=submit]').bind('click', function() { 
      $(this).parents('form').unbind("mouseout");
      $(this).siblings("img").show();
      $(this).hide();
      _gaq.push(['_trackEvent', 'Compartilhar', "Postar no Mural do Amigo"]);
    });
  },

  handle_signature_submit: function(e){
    e.preventDefault();
    if($("form#new_petition_signature").valid()){
      $("#loader").show();
      $('#submit_btn').hide();
      var data = $(this).serialize();
      $.post($(this).attr('action'), data, MR.petitions.handle_signature_response);
    }
  },

  handle_signature_response: function(data){
    var $counter = $('span.counter'), $progress = $('.progress'), $goal = $('.goal');
    // Here we update the counter (if we have one) and the progress (if we have it)
    if($counter.length != 0){
      var count = parseInt($counter.html());
      $counter.html(count + 1);
      if($goal.length != 0){
        var goal = parseInt(/(\d+)/.exec($goal.html())[1]);
        var percent = Math.floor((count * 100) / goal);
        if(goal && goal > 0 && percent <= 100){
          $progress.animate({width: percent + '%'});
        }
      }
    }
    window.location.hash = data.hash;
  },

  check_for_existing_signature_by_email: function(){
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
  },

  runThese: function(params){
    $('option', '#member_zona').removeAttr('selected');
    $('option[value=' + $(params).attr('href') + ']', '#member_zona').attr('selected', 'selected');
  }
}
