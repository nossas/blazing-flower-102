console.log("Loaded /app/assets/javascripts/admin/petitions.js");

$(function(){
  window.petitionForm = new FormView({
    el: $('#petition_form'),
    model: new Petition()
  });
});
