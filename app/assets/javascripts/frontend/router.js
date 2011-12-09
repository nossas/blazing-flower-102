MR.Router = Backbone.Router.extend({
  routes: {
    "list_update/:id": "list_update",
    "list_remove/:id": "list_remove",
    "list_clear": "list_clear",
    "list_view": "list_view",
    "search": "search",
    "selected": "selected"
  },
  list_update: function(){},
  list_remove: function(){},
  selected: function(){},
  list_view: function(){},
  search: function(){},
  list_clear: function(){}
});
