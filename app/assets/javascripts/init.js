MR = {
  common: {
    init: function() {
      // application-wide code
      MR.common.googleLogout();
      MR.common.faceboxInit();
      MR.common.mainNavDonationLink();

      $('.member_panel .arrow').bind('click', function(){
        $('.flyout').toggle();
        var $panel = $(this).parent().parent();
        if($panel.hasClass('active')){
          $panel.removeClass('active');
        }else{
          $panel.addClass('active');
        }
      });
    },

    googleLogout: function(){
      $('iframe#google_logout_iframe').load(function(){
        window.location.href = "/logout";
      });
    },

    faceboxInit: function(){
      $.facebox.settings.closeImage = "/assets/closelabel.png";
      $.facebox.settings.loadingImage = "/assets/loading.gif";

      $("[rel=facebox]").facebox();
    },

    addFragmentListener: function(){
      store.set('lastFragment', $(this).data('record-fragment'));
    },

    handleFragmentEvent: function(){
      if(store.get('lastFragment')){
        window.location.href = window.location.href + '#' + store.get('lastFragment');
        store.remove('lastFragment');
      }
    },

    mainNavDonationLink: function(){
      $('#main_nav_donate').click(function(){
        $('.moip form').submit();
        console.log('post submit');
        return false;
      });
    },

    setUpDropDowns: function(callback){
      var $dropdown_ul = $(".dropdown dd ul");

      $(".dropdown dt").bind('click', function() {
          $dropdown_ul.toggle();
      });

      $(".dropdown dd ul li a").unbind('click').bind('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var text = $this.html();
        $(".dropdown dt span").html(text);
          $dropdown_ul.hide();
          callback ? callback(this) : function(){};
      });
      
      $(document).unbind('click').bind('click', function(e) {
        var $clicked = $(e.target);
        if (! $clicked.parents().hasClass("dropdown"))
          $dropdown_ul.hide();
        });

      //initializers
      MR.issues.removeLastBorder();
      if(Modernizr.history){
        window.addEventListener("popstate", function(e){
          if(e.state !== null){
            MR.issues.replaceArticles(e.state);
            $(".dropdown dt span").html(e.state.issue.name);
          }
        });
      }
    }
  },

  users: {
    init: function() {
      // controller-wide code
    },

    show: function() {
      // action-specific code
    }
  }
};

UTIL = {
  exec: function( controller, action ) {
    var ns = MR,
        action = ( action === undefined ) ? "init" : action;

    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },

  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller" ),
        action = body.getAttribute( "data-action" );

    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
  }
};

$( document ).ready( UTIL.init );

