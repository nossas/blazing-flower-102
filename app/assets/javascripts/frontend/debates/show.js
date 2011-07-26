$('.flag').bind('ajax:success', function(event, data){
    $(this).show();
    $("#flag_loading").hide();
    var link = $(this);
    if(link.data("method") == "post"){
      link.html(unflag_label).data("method", "delete").attr("href", link.attr("href") + "/" + data.id);
    }
    else{
      var path_array = link.attr("href").split("/");
      var path = path_array.slice(0, (path_array.length - 1)).join("/");
      link.html(flag_label).data("method", "post").attr("href", path);
    }
});

$(".flag").bind("click", function(){
    $(this).hide();
    $("#flag_loading").show();
});
