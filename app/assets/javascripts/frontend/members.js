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

    $.ajax({
      type: 'POST',
      url: '/members/' + $('.profile').attr('data-id'),
      data: data,
      success: function(data, status, xhr){
        console.log(data);
        console.log(status);
        if($form.children('select').length > 0){
          console.log('select');
          $display.html($form.children('select').val());
        } else if($form.children('textarea').length > 0){
          console.log('textarea');
          $display.html($form.children('textarea').val());
        } else {
          console.log('not textarea or select');
          $display.html($form.children('input').val());
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
