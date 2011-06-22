describe("Petition", function(){
  var model;

  beforeEach(function() {
    model = new Petition();
  });

  it("should validate the title is present", function(){
    model.set({title: ''});
    expect(model.validate(model.attributes)).toEqual({title: ["Por favor preencha o título"]});
    model.set({title: 'this is a test title'});
    expect(model.validate(model.attributes)).toEqual(undefined);
  });

});
