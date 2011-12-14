describe("BaseView", function(){
  var view = null;
  var storeStub;

  Backbone = { history: { navigate: function(){}, getFragment: function(){} } };
  beforeEach(function(){
    var body = $('body').append('<div id="member_panel">');
    view = new MR.BaseView({el: body});
    spyOn($, "facebox");
    storeStub = {get: function(){}, set: function(){}, remove: function(){}};
  });

  describe("#getStore", function(){
    it("should create a store inside view.store and return it", function(){
      expect(view.getStore()).toEqual(jasmine.any(Store));
      expect(view.store).toEqual(jasmine.any(Store));
    });
  });

  describe("#requireLogin", function(){
    beforeEach(function(){
      spyOn(view, "loginDialog");
      view.store = storeStub;
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

    it("should set current URL fragment in view.store if user is not logged in", function(){
      spyOn(view, "isLoggedIn").andReturn(false);
      spyOn(view.store, "set");
      spyOn(Backbone.history, "getFragment").andReturn('last_fragment');
      view.requireLogin()
      expect(view.store.set).toHaveBeenCalledWith('lastFragment', 'last_fragment');
    });
  });

  describe("#loginDialog", function(){
    it("should call facebox with #login div", function(){
      view.loginDialog();
      expect($.facebox).toHaveBeenCalledWith({div: '#login'});
    });
  });

  describe("#isLoggedIn", function(){
    it("should return false when user is NOT logged in", function(){
      expect(view.isLoggedIn()).toEqual(false);
    });

    it("should return true when user is logged in", function(){
      view.$('#member_panel').append('<div class="flyout">');
      expect(view.isLoggedIn()).toEqual(true);
    });
  });

  describe("#loadLastFragment", function(){
    beforeEach(function(){
      view.store = storeStub;
      spyOn(view.store, "get").andReturn('last_fragment');
      spyOn(view.store, "remove");
      spyOn(Backbone.history, "navigate");
      view.loadLastFragment();
    });

    it("should remove lastFragment from view.store", function(){
      expect(view.store.remove).toHaveBeenCalledWith('lastFragment');
    });

    it("should navigate to lastFragment from view.store if there is one", function(){
      expect(view.store.get).toHaveBeenCalledWith('lastFragment');
      expect(Backbone.history.navigate).toHaveBeenCalledWith('last_fragment');
    });
  });
});
