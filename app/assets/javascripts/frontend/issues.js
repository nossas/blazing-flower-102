MR.issues = {
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
    
    $('.article').last().css('border-bottom', '1px solid #2cbae2');
  },

  articleTemplate: $.template(null,
                               '{{each articles}}<div class="article grid_12">{{if question}}<div class="grid_2 alpha"><img src="/assets/archive_debate_icon.png"></div> <div class="grid_8 omega"><a href="/debates/${id}" class="title">${title} >></a><div class="date">${created_at}</div><div class="excerpt">${question}</div></div>{{/if}} {{if connected_action}}<div class="grid_2 alpha"><img src="/assets/archive_video_icon.png"></div> <div class="grid_8 omega"><a href="/issue/${issue.id}/personal-stories/${id}" class="title">${title} >></a><div class="date">${created_at}</div><div class="excerpt">${excerpt}</div></div>{{/if}} {{if custom_path}}<div class="grid_2 alpha"><img src="/assets/archive_petition_icon.png"></div><div class="grid_8 omega"><a href="/petitions/${custom_path}" class="title">${headline} >></a><div class="date">${created_at}</div><div class="excerpt">${short_description}</div></div>{{/if}}</div>{{/each}}'),

  getIssueArticles: function(issue_path){
    $.ajax({
      url: issue_path,
      type: 'GET',
      dataType: 'html',
      success: function(data){
        MR.issues.replaceArticles(data);
      } 
    });
  },

  replaceArticles : function(data){
    var datum = $.parseJSON(data); 
    var $previous = $('.previous');
    var $next = $('.next');

    $('.count').html('Displaying ' + datum.start + '-' + datum.end + ' of ' + datum.count);
    if(datum.start < 5){
      $('.previous').hide();
    } else {
      $('.previous').show();
      $('.previous').attr('href', '/issues/' + datum.issue.id + '/archive/' + (datum.page - 1));
    }
    if(datum.end >= datum.count){
      $('.next').hide();
    } else {
      $('.next').show();
      $('.next').attr('href', '/issues/' + datum.issue.id + '/archive/' + (datum.page + 1));
    }
    _.each(datum.articles, function(article){
        article.created_at = new Date(article.created_at).toDateString();
    });

    $('.articles').empty();
    $.tmpl(MR.issues.articleTemplate, datum).appendTo($('.articles')); 
    $('.article').last().css('border-bottom', '1px solid #2cbae2');
  }

}
