MR = {
  common: {
    init: function() {
      // application-wide code
      MR.common.googleLogout();

      $.facebox.settings.closeImage = "/assets/closelabel.png";
      $.facebox.settings.loadingImage = "/assets/loading.gif";

      $("[rel=facebox]").facebox();
    },

    googleLogout: function(){
      $('iframe#google_logout_iframe').load(function(){
        window.location.href = "/logout";
      });
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

