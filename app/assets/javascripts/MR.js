MR = {
  editable: {
    defaults: {
      tooltip: "Click to edit",
      submit: "Ok",
      cancel: "Cancel"
    }
  },

  common: {
    finish: function(){
      Backbone.history.start();
    },

    init: function() {
      // application-wide code
      if(!window.store){
        window.store = new Store('global');
      }

      if(!MR.router){
        MR.router = new MR.Router();
      }

      if(App && App.editable){
        $.extend(true, MR.editable, App.editable);
      }

      MR.common.closeFlash();

      MR.common.googleLogout();
      MR.common.faceboxInit();
      MR.common.setBodyBackgroundClass();
      MR.common.setupLogoAnimation();
      MR.common.loadMemberRegistration();

      $('.member_panel .right.info').bind('click', function(){
        MR.common.openMemberFlyout();
      });

      $("#new_registration #member_new").live('submit', function(e){
        e.preventDefault();
        var $form = $(this), $errors = $("#errors");
        $errors.hide();
        if($form.valid()){
          var data = $form.serialize();
          $.post("/members", data, function(data, textStatus, jqXHR){
            if(data.errors != null){
              var error_data = '';
              for(error in data.errors){
                error_data = error_data + data.errors[error] + "</br>";
              }
              $errors.show();
              $errors.html(error_data);
            }else{
              if(data.flash != null){
                $("#flashTemplate").tmpl(data).prependTo("body");
              }
              $(document).trigger('close.facebox');
            }
          });
        }
      });

      $("#sign_in_form #member_new").live('submit', function(e){
        e.preventDefault();
        var $form = $(this), $errors = $("#errors");
        $errors.hide();
        data = $form.serialize();
        $.post("/members/sign_in", data, function(data, textStatus, jqXHR){
          if(data.logged_in === true){
            location.reload();
          }else{
            $errors.html("Email ou senha inválidos.");
            $errors.show();
          }
        });
      });

      $('.back a').live('click', function(e){
        e.preventDefault();
        var target = $(this).attr('href');
        $(".popup .content").html($(target).html());
      });

      $('#resend_password').live('click', function(e){
        e.preventDefault();
        $.get("/members/passwords/resend");
      });

    },

    loadMemberRegistration : function() {
      $('#create a').live('click', function(e){
        e.preventDefault();
        var $content = $(".popup .content");
        $content.load("/members/sign_up", function(){
          $("form#member_new").validate({
            messages: {
              "member[first_name]": "Campo obrigatório",
              "member[last_name]": "Campo obrigatório",
              "member[email]": {"required": "Campo obrigatório", "email": "E-mail inválido"},
              "member[password]": "Campo obrigatório",
              "member[password_confirmation]": "Campo obrigatório"
            }
          });
        });
      });
    },

    updateIdeaLikes: function(updateUrl, likes){
      var idea = {
        "idea": {
          "likes": likes,
        }
      };
      $.ajax({
        type: "PUT",
        data: idea,
        url: updateUrl,
        success: function(data){
          console.log(data)
        },
        error: function(data){
          console.log(data)
        }
      });
    },

    searchCategoryId : function(id){
      return MR.router.navigate('category/' + id, true);
    },

    setupLogoAnimation : function() {
      $('a span.logo').hover(
        function(e){$('a span.tagline').fadeIn();},
        function(e){$('a span.tagline').fadeOut();}
      );
    },

    closeFlash : function(){
      $('#close_messages').live('click', function(e){
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
      $(document).bind('reveal.facebox', function() {
        $('#mr_login a').click(function(e){
          e.preventDefault();
          var $content = $(".popup .content");
          $content.load("/members/sign_in");
        });
      });
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

      $(".dropdown dt").bind('click', function() {
          $(this).siblings('dd').children('ul').toggle();
      });

      $(".dropdown dd ul li a").unbind('click').bind('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var text = $this.html();
        var $dropdown = $this.parents('.dropdown');
        $dropdown.children('dt').children('span').html(text);
        $dropdown.children('dd').children('ul').hide();
        callback ? callback(this) : function(){};
      });

      $(document).unbind('click').bind('click', function(e) {
        var $clicked = $(e.target);
        if (!$clicked.parents().hasClass("dropdown")){
          $('.dropdown dd ul').hide();
        }
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
