$('[data-record-fragment]').click(function(){
  store.set('lastFragment', $(this).data('record-fragment'));
});

$(document).ready(function(){
  if(store.get('lastFragment')){
    window.location.href = window.location.href + '#' + store.get('lastFragment');
    store.remove('lastFragment');
  }
});
