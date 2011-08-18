MR.issues = {
  show: function(){
    $('#read_more').click(MR.issues.readMore);
  },

  readMore: function(){
    $('.description').slideDown();
    $('#read_more').remove();
    return false;
  },

  archive: function(){
    var $dropdown_ul = $(".dropdown dd ul");

    $(".dropdown dt").bind('click', function() {
        $dropdown_ul.toggle();
    });

    $(".dropdown dd ul li a").bind('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var text = $this.html();
        $(".dropdown dt span").html(text);
        $dropdown_ul.hide();
        MR.issues.getIssueArticles($this.attr('href'));
    });
    
    $(document).bind('click', function(e) {
        var $clicked = $(e.target);
        if (! $clicked.parents().hasClass("dropdown"))
            $dropdown_ul.hide();
    });

    //initializers
    $('.article').last().css('border-bottom', '1px solid #2cbae2');
    if(Modernizr.history){
      window.addEventListener("popstate", function(e){
        if(e.state !== null){
          MR.issues.replaceArticles(e.state);
          $(".dropdown dt span").html(e.state.issue.name);
        }
      });
    }
  },

  articleTemplate: $.template(null,
                               '{{each articles}}<div class="article grid_12">{{if question}}<div class="grid_2 alpha"><img src="/assets/archive_debate_icon.png"></div> <div class="grid_8 omega"><a href="/bate-bola/${id}" class="title">${title} >></a><div class="date">${created_at}</div><div class="excerpt">${question}</div></div>{{/if}} {{if connected_action}}<div class="grid_2 alpha"><img src="/assets/archive_video_icon.png"></div> <div class="grid_8 omega"><a href="/na_atividade/${issue.id}/direto_da_gema/${id}" class="title">${title} >></a><div class="date">${created_at}</div><div class="excerpt">${excerpt}</div></div>{{/if}} {{if custom_path}}<div class="grid_2 alpha"><img src="/assets/archive_petition_icon.png"></div><div class="grid_8 omega"><a href="/na_atividade/${issue.id}/assine_embaixo/${custom_path}" class="title">${headline} >></a><div class="date">${created_at}</div><div class="excerpt">${short_description}</div></div>{{/if}}</div>{{/each}}'),

  getIssueArticles: function(issue_path){
    $.ajax({
      url: issue_path,
      type: 'GET',
      dataType: 'html',
      success: function(data){
        data = $.parseJSON(data);
        MR.issues.replaceArticles(data);
        MR.issues.setHistory(data);
      } 
    });
  },

  replaceArticles : function(data){
    var datum = data; 
    var $previous = $('.previous');
    var $next = $('.next');

    $('.count').html('Exibindo ' + datum.start + '-' + datum.end + ' de ' + datum.count);
    if(datum.start < 5){
      $('.previous').hide();
    } else {
      $('.previous').show();
      $('.previous').attr('href', '/na_atividade/' + datum.issue.id + '/arquivo/' + (datum.page - 1));
    }
    if(datum.end >= datum.count){
      $('.next').hide();
    } else {
      $('.next').show();
      $('.next').attr('href', '/na_atividade/' + datum.issue.id + '/arquivo/' + (datum.page + 1));
    }
    _.each(datum.articles, function(article){
        article.created_at = new Date(article.created_at).toDateString();
    });

    $('.articles').empty();
    $.tmpl(MR.issues.articleTemplate, datum).appendTo($('.articles')); 
    $('.article').last().css('border-bottom', '1px solid #2cbae2');
  },

  setHistory : function(data){
    if(Modernizr.history){
      history.pushState(data, '', '/na_atividade/' + data.issue.id + '/arquivo');
    }
  }
}

