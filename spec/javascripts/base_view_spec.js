describe("BaseView", function(){
  var view = null;
  beforeEach(function(){
    var body = $('body').append('<div id="member_panel">');
    view = new MR.BaseView({el: body});
  });

  describe("#loginDialog", function(){
    it("should call facebox with #login div", function(){
      spyOn($, "facebox");
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
