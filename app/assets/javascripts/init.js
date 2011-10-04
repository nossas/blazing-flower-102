MR = {
  common: {
    init: function() {
      // application-wide code
      MR.common.closeFlash();

      MR.common.googleLogout();
      MR.common.faceboxInit();
      MR.common.setBodyBackgroundClass();
      MR.common.setupLogoAnimation();
      MR.common.loadMemberRegistration();
      MR.common.loadMemberLogin();

      $('.member_panel .right.info').bind('click', function(){
        MR.common.openMemberFlyout();
      });

      $("#new_registration #member_new").live('submit', function(e){
        e.preventDefault();
        var $form = $(this);
        data = $form.serialize();
        $.post("/members", data, function(data, textStatus, jqXHR){
          if(data.errors != null){
            for(error in data.errors){ 
              $form.prepend(data.errors[error] + "</br>");
            };
          }else{
            if(data.flash != null){
              $("#flashTemplate").tmpl(data).prependTo("body");
            }
            $(document).trigger('close.facebox');
          } 
        });
      });

    },

    loadMemberLogin : function(){
      $('#mr_login a').live('click', function(e){
        e.preventDefault();
        var $content = $(".popup .content");
        $content.css("width", "465");
        $content.load("/members/sign_in");
      });
    },

    loadMemberRegistration : function() {
      $('#create a').live('click', function(e){
        e.preventDefault();
        var $content = $(".popup .content");
        $content.css("width", "465");
        $content.load("/members/sign_up");
      });
    },

    setupLogoAnimation : function() {
      $('a span.logo').hover(
        function(e){$('a span.tagline').fadeIn();},
        function(e){$('a span.tagline').fadeOut();}
      );
    },

    closeFlash : function(){
      $('#close_messages').click(function(e){
        e.preventDefault();
        $('.messages').slideUp();
      });
    },

    openMemberFlyout : function(){
      var $panel = $('.member_panel'), $flyout = $('.flyout');
      var open = !0;
      $flyout.show();
      $panel.addClass("active");
      $(document).bind("click.member_panel", function(){
        open ? open = !1 : ($(document).unbind("click.member_panel"), $panel.removeClass("active"), $flyout.hide());
      });
    },

    addFragmentListener: function(){
        store.set('lastFragment', $(this).data('record-fragment'));
      },
    
    faceboxInit: function(){
      $.facebox.settings.closeImage = "/assets/closelabel.png";
      $.facebox.settings.loadingImage = "/assets/loading.gif";
      $("[rel=facebox]").facebox();
    },

    googleLogout: function(){
      $('iframe#google_logout_iframe').load(function(){
        window.location.href = "/logout";
      });
    },

    handleFragmentEvent: function(){
      if(store.get('lastFragment')){
        window.location.href = window.location.href + '#' + store.get('lastFragment');
        store.remove('lastFragment');
      }
    },
    
    /**
     * Adds a random class to the body which CSS uses to set the background img
     */
    setBodyBackgroundClass: function(){
        var backgrounds = ['blue', 'green', 'orange', 'pink'],
            thisBackground = backgrounds[Math.round(Math.random()*100%3)];
        
        $('body').addClass('background_' + thisBackground);
      },
      
    mainNavDonationLink: function(){
      $('#main_nav_donate').click(function(){
        $('.moip form').submit();
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
    init: function(){
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
