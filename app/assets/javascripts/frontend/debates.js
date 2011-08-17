MR.debates = {
  show: function(){
    var $new_comment = $('#new_comment');
    var $form = $("form#new_comment");
    var $submitButton = $form.find('input[name="commit"]');
    var $comment_count = $('.comments_tooltip');

    var page = 2;
    var debate = $("h1.grid_12").attr("data-debate");

    //initializers
    $('#new_comment').hide();

    //listeners
    $(window).bind('hashchange', function(){
      if(window.location.hash == '#new_comment'){
        MR.debates.openNewComment();
      }
    });

    $('#close').bind('click', MR.debates.closeNewComment);

    $submitButton.bind('click', function(){
      if($form.valid()){
        $submitButton.data( 'origText', $(this).val());
        $submitButton.val( "Enviando...");
      }
    });

    $form.validate({
      messages: {
        "comment[content]": "Por favor preencha o seu comentário."
      }
    });

    $form.bind("ajax:success", function(evt, data, status, xhr){
        $form.find('textarea').val("");
        $('.previous_comments').append(data);
        $comment_count.each(function(){
          $(this).text(parseInt($(this).text()) + 1);
        });
        MR.debates.allCommentsLoaded();
      }).bind("ajax:complete", function(evt, xhr, status){
        $submitButton.val($submitButton.data('origText'));
        MR.debates.closeNewComment();
      }).bind("ajax:error", function(evt, xhr, status, error){
        $form.prepend("Houve um erro no envio do comentário. Tente recarregar a página.");
      });

      //load more comments via ajax
      $load_more = $(".load_more");
      
      $load_more.bind('click', function(e, callback){
        $load_more.data('origText', $(this).html());
        $load_more.html( "Carregando..." );
        $.ajax({
            url: '/debates/' + debate + '/load_comments/' + page,
            type: 'GET',
            dataType: 'html',
            success: function(data){
              if (data){
                page++;
                $('.previous_comments').append(data);
                $load_more.html($load_more.data('origText'));
              } else {
                MR.debates.allCommentsLoaded();
              };
              if(callback){ callback(data); }
            },
            error: function(xhr, status){
              $load_more.html("Houve um erro na carga dos comentários. Tente recarregar a página.");
            }
        });
      });

    $(".flag").live("click", function(){
      $(this).hide();
      $(this).next(".flag_loading").show();
    });

    $('.flag').live('ajax:success', function(event, data){
      var link = $(this);
      if(link.data("method") == "post"){
        link.html(unflag_label).data("method", "delete").attr("href", link.attr("href") + "/" + data.id);
      }
      else{
        var path_array = link.attr("href").split("/");
        var path = path_array.slice(0, (path_array.length - 1)).join("/");
        link.html(flag_label).data("method", "post").attr("href", path);
      }
    }).live("ajax:complete", function(evt, xhr, status){
      $(this).show();
      $(this).next(".flag_loading").hide();
    }).bind("ajax:error", function(evt, xhr, status, error){
      $(this).html("Houve um erro ao denunciar o comentário. Tente recarregar a página.");
    });
  },

  allCommentsLoaded: function(){
    $load_more.unbind();
    $load_more.html("Todos os comentários estão visíveis agora");  
    $load_more.removeClass("load_more_link");  
  },

  openNewComment: function(){
    var debate = $("h1.grid_12").attr("data-debate");
    $('.new_comment_loading').show();
    $.get('/debates/' + debate + '/comments').success(function(data){
      $('.previous_comments .comment').remove();
      $('.previous_comments').append(data);
      page = Math.ceil($('.previous_comments .comment').length / 5) + 1;
      $new_comment.show(); 
      $(window).scrollTop($new_comment.offset().top);
      $("#bottom_buttons").hide();
    })
    .complete(function(){
      $('.new_comment_loading').hide();
    });
  },

  closeNewComment: function(){
    window.location.hash = 'comments_bottom';
    $('#comment_content').val('');
    $new_comment.hide(); 
    $("#bottom_buttons").show();
  }
}

