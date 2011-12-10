describe("BaseView", function(){
  var view = null;
  beforeEach(function(){
    var body = $('body').append('<div id="member_panel">');
    view = new MR.BaseView({el: body});
    spyOn($, "facebox");
  });

  describe("#requireLogin", function(){
    beforeEach(function(){
      spyOn(view, "loginDialog");
    });

    it("should call loginDialog if isLoggedIn is false and return false", function(){
      spyOn(view, "isLoggedIn").andReturn(false);
      expect(view.requireLogin()).toEqual(false);
      expect(view.loginDialog).toHaveBeenCalled();
    });

    it("should NOT call loginDialog if isLoggedIn is true and return true", function(){
      spyOn(view, "isLoggedIn").andReturn(true);
      expect(view.requireLogin()).toEqual(true);
      expect(view.loginDialog).wasNotCalled();
    });
  });

  describe("#loginDialog", function(){
    it("should call facebox with #login div", function(){
      view.loginDialog();
      expect($.facebox).toHaveBeenCalledWith({div: '#login'});
    });
  });

  describe("#isLoggedIn", function(){
    it("should return true when user is NOT logged in", function(){
      expect(view.isLoggedIn()).toEqual(false);
    });

    it("should return true when user is logged in", function(){
      view.$('#member_panel').append('<div class="flyout">');
      expect(view.isLoggedIn()).toEqual(true);
    });
  });
});
