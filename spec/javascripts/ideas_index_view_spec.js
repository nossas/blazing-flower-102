describe("IdeasIndexView", function(){
  var view = null;
  MR.router = {bind: function(){}};

  beforeEach(function(){
    var body = $('body').append('<div id="member_panel">');
    view = new MR.IdeasIndexView({el: body});
    spyOn($, "facebox");
  });

  describe("#bindRoutes", function(){

    it("should bind new_idea route and search_category route", function(){
      spyOn(MR.router, "bind");
      view.bindRoutes();
      expect(MR.router.bind).toHaveBeenCalledWith('route:new_idea', view.newIdea);
      expect(MR.router.bind).toHaveBeenCalledWith('route:search_category', view.searchCategory);
    });
  });

  describe("#searchCategory", function(){
    it("should receive a search param and then filter ideas by category", function(){
      var param = 1;
      spyOn(view, "searchCategory");
      view.searchCategory(param);
      expect(view.searchCategory).toHaveBeenCalledWith(param);

    });
  });

  describe("#newIdea", function(){
    it("should call facebox with div #new_idea if user is logged in", function(){
      spyOn(view, "isLoggedIn").andReturn(true);
      view.newIdea();
      expect($.facebox).toHaveBeenCalledWith({div: '#new_idea'});
    });

    it("should call facebox with login if user is anonymous", function(){
      spyOn(view, "isLoggedIn").andReturn(false);
      spyOn(view, "loginDialog");
      view.newIdea();
      expect(view.loginDialog).toHaveBeenCalled();
    });
  });

});
