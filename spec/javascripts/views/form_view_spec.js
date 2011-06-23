describe("FormView", function(){
  var view;
  var model;

  beforeEach(function() {
    model = new Backbone.Model();
    view = new FormView({model: model})
    view.el = $('<form id="petition_form">'
                + '<input name="petition[title]" value="test title" id="petition_title">'
                + '<label for="petition_title" id="petition_title_errors"></label>'
                + '</form>');
  });

  describe("#persist", function(){
    it("should copy values from form to the model", function(){
      expect(view.persist().model.get('title')).toEqual('test title');
    });
  });

  describe("#initialize", function(){
    it("should bind handleErrors to this in bindAll", function(){
      spyOn(_, "bindAll");
      view.initialize();
      expect(_.bindAll).toHaveBeenCalledWith(view, 'handleErrors');
    });

    it("should bind its model error event to handleErrors", function(){
      spyOn(model, "bind");
      view.initialize();
      expect(model.bind).toHaveBeenCalledWith('error', view.handleErrors);
    });
  });

  describe("#handleErrors", function(){
    it("should display errors inline with the fields when we get a remote error", function(){
      var errors = {responseText: "{\"title\":[\"Can't be blank\"]}"};
      view.handleErrors(model, errors);
      expect(view.$('#petition_title_errors').html()).toEqual("Can't be blank");
    });

    it("should display errors inline with the fields", function(){
      var errors = {title : ["Can't be blank"]};
      view.handleErrors(model, errors);
      expect(view.$('#petition_title_errors').html()).toEqual("Can't be blank");
    });
  });

  describe("#save", function(){
    it("should call persist and then its model's save", function(){
      spyOn(view, "persist").andCallFake(function(){
        model.set({title: 'test title'});
      });
      spyOn(Backbone, "sync").andCallFake(function(method, model){
        expect(model.attributes).toEqual({title: 'test title'});
      });
      view.save();
      expect(Backbone.sync).toHaveBeenCalled();
    });
  });

});
