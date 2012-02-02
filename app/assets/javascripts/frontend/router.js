MR.Router = Backbone.Router.extend({
  routes: {
    'fork': 'fork',
    'publish': 'publish',
    'new_idea': 'new_idea',
    'remove': 'remove',
    'description': 'description',
    'versions': 'versions',
    'category/:params': 'search_category',
  },
  fork: function(){},
  publish: function(){},
  new_idea: function(){},
  remove: function(){},
  description: function(){},
  versions: function(){},
  search_category: function(params){}

});
