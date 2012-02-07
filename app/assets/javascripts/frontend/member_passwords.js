MR.member_passwords = {
  member_new: function(){
    $("form#member_new").validate({
      messages: {
        "member[email]": {"required": "Campo obrigatório", "email": "E-mail inválido"}
      }
    });

    $(".new form#member_new").bind('submit', function(e){
      var $form = $(this), $errors = $("#errors");
      e.preventDefault();
      $errors.hide();
      if($form.valid()){
        var data = $form.serialize();
        $.post("/members/password", data, function(data, textStatus, jqXHR){
          if(data.errors != null){
            var error_data = '';
            for(error in data.errors){ 
              error_data = error_data + data.errors[error] + "</br>";
            }
            $errors.html(error_data);
            $errors.show();
          }else{
            if(data.flash != null){
              location = "/"
            }
          } 
        });
      }
    });
  }
}
