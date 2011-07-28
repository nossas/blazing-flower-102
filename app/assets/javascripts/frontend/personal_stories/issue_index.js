// $(document).ready(function(){

//   var $current_video = $('#current_video');
//   var $current_title = $('#current_title');
//   var $current_description = $('#current_description');

//   $('.story .thumbnail').each(function(){
//     $(this).bind('click', function(){
//       $.ajax({
//         url: '/personal_stories/' + $(this).attr('data-storyID'),
//         type: 'GET',
//         dataType: 'json',
//         success: function(data){
//           $current_video.html(data.video_embed_code);
//           $current_title.html(data.title);
//           $current_description.html(data.description);
//           if(data.connected_action == "DEBATE"){
//             $('.petition.btn').hide();
//             $('.debate.btn').show();
//           } else if(data.connected_action == "PETITON" {
//             $('.debate.btn').hide();
//             $('.petition.btn').show();
//           } else {
//             $('.take_action').hide();
//           }
//         },
//         error: function(xhr, status){
//         }
//       }); 
//     });
//   });

// });
