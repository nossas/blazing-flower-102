// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $("form.new_letter").validate({
    messages: {
      "letter[sender]":{
        required: "Este campo é obrigatório"
      },
      "letter[email]":{
        required: "Este campo é obrigatório",
        email: "Formato de email inválido"
      }
    }
  });
});
