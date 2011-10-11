MR.member_passwords = {
  new: function(){
    $("form#member_new").validate({
      messages: {
        "member[email]": {"required": "Campo obrigatório", "email": "E-mail inválido"}
      }
    });
  }
}
