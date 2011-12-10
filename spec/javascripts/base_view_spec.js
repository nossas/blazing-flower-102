describe("BaseView", function(){
  var view = null;
  beforeEach(function(){
    view = new MR.BaseView();
  });

  describe("#isLoggedIn", function(){
    it("should return true when user is logged in", function(){
      expect(view.isLoggedIn()).toEqual(true);
    });
  });
});
