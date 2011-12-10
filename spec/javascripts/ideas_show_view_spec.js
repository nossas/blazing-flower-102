describe("IdeasShowView", function(){
  var view = null;
  MR.router = {bind: function(){}};

  beforeEach(function(){
    var body = $('body').append('<div id="member_panel">');
    view = new MR.IdeasShowView({el: body});
    spyOn($, "facebox");
  });

  describe("#bindRoutes", function(){
    it("should bind fork route", function(){
      spyOn(MR.router, "bind");
      view.bindRoutes();
      expect(MR.router.bind).toHaveBeenCalledWith('route:fork', view.fork);
    });
  });

  describe("#fork", function(){
    it("should call facebox with div #confirm_fork_idea", function(){
      view.fork();
      expect($.facebox).toHaveBeenCalledWith({div: '#confirm_fork_idea'});
    });
  });

});
