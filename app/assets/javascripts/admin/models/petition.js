console.log("Loaded /app/assets/javascripts/admin/models/petition.js");

window.Petition = Backbone.Model.extend({
  initialize: function(){},

  url : function() {return this.get('id') ? '/admin/petitions/' + this.get('id') : '/admin/petitions'},

  validate : function(attrs){
    if (!attrs.title) {
      return {title: ["Por favor preencha o título"]};
    }
    // Don't return anything if validation passes
  }
});
