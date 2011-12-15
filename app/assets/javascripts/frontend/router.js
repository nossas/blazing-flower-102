MR.Router = Backbone.Router.extend({
  routes: {
    'fork': 'fork',
    'new_idea': 'new_idea',
    'remove': 'remove',
    'description': 'description',
    'versions': 'versions',
    'filter/category/:params': 'search_category',
  },
  fork: function(){},
  new_idea: function(){},
  remove: function(){},
  description: function(){},
  versions: function(){},
  search_category: function(params){}

});
