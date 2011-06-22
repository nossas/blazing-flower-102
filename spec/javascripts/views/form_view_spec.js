describe("FormView", function(){
  var view;
  var model;
  var template = $('<script><div>name is {{#model}}{{#attributes}}{{name}}{{/attributes}}{{/model}}</div>{{thisShouldBeLambda}}</script>');
  var expected = '<div>name is test</div>test lambda';

  beforeEach(function() {
    model = new Backbone.Model({id: 1, name: 'test'});
    view = new FormView({model: model, template: template})
  });

  describe("#persist", function(){
    it("should copy values from form to the model", function(){
      view.el = '<form id="petition_form"><input name="petition[title]" value="test title"></form>';
      expect(view.persist().model.get('title')).toEqual('test title');
    });
  });
});
