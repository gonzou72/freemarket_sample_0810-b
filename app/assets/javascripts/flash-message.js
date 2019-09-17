$(function(){
  setTimeout("$('.flash-message').fadeOut('slow')", 2000)

  $('.flash-message .close-icon').on('click',function(){
    $('.flash-message').css('display', 'none');
  });
});