MR.members = {
  show: function(){
    $('a.change').each(function(){
      $(this).bind('click', function(e){
        e.preventDefault();
        MR.members.editProfile(this);
      });
    });

    $('.cancel').each(function(){
      $(this).bind('click', function(e){
        e.preventDefault();
        MR.members.closeEdit(this);
      });
    });

    $('.confirm').each(function(){
      $(this).bind('click', function(e){
        e.preventDefault();
        MR.members.updateProfile(this);
      });
    });

    $("#member_bio").keyup(function(){
      $("#member_tip").html((200 - $("#member_bio").val().length) + " caracteres");
    });

    $("#member_meu_rio_is").keyup(function(){
      $("#meu_rio_is_tip").html((140 - $("#member_meu_rio_is").val().length) + " caracteres");
    });
  },

  closeEdit: function(button){
    var $button = $(button);
    $button.parent().hide();
    $button.parent().siblings('.display').show();
    $button.parent().siblings('.change').show();
  },

  editProfile: function(field){
    var $field = $(field);
    $field.hide();
    $field.siblings('.display').hide();
    $field.siblings('.edit').show();
  },

  updateProfile: function(button){
    var $button = $(button);
    var $form = $button.siblings('form');
    var $display = $button.parent().siblings('.display');
    var data = $form.serialize();

    MR.form = $form;

    $form.validate({
      rules: {
        'member[bio]': { maxlength: 200 },
        'member[meu_rio_is]': { maxlength: 140 }, 
        'member[email]': { email: true }
      } 
    });

    if($form.valid()){
      $.ajax({
        type: 'POST',
        url: '/members/' + $('.profile').attr('data-id'),
        data: data,
        success: function(data, status, xhr){
          if($form.children('select').length > 0){
            $display.html($form.children('select').val());
          } else if($form.children('textarea').length > 0){
            $display.html($form.children('textarea').val());
          } else {
            var changedText = "";
            $form.children('input').each(function(){
              changedText = changedText + ' ' + $(this).val();
            });
            $display.html(changedText);
          }
          MR.members.closeEdit(button);
        },
        error: function(data, status, xhr){
          var errors = $.parseJSON(data.responseText);
          for(var key in errors){
            if(errors.hasOwnProperty(key)){
              $form.append('<p class="error"><span class="key">' + key + '</span> ' + errors[key] + '</p>');
            }
          }
        },  
        dataType: 'json'
      });
    }

  }
}
