$(function(){
  $('.information-title li').on('click',function(){
    var index = $('.information-title li').index(this);

    if (index == 0 ){
      $('.information-todos').addClass('hidden');
      $('.information-title__todos').removeClass('active');
      $('.information-news').removeClass('hidden');
      $('.information-title__news').addClass('active');
    } else if (index == 1){
      $('.information-news').addClass('hidden');
      $('.information-title__news').removeClass('active');
      $('.information-todos').removeClass('hidden');
      $('.information-title__todos').addClass('active');
    }
  });

  $('.histories-title li').on('click',function(){
    var index = $('.histories-title li').index(this);
    
    if (index == 0 ){
      $('.histories-past-trading').addClass('hidden');
      $('.histories-title__past-trading').removeClass('active');
      $('.histories-trading').removeClass('hidden');
      $('.histories-title__trading').addClass('active');
    } else if (index == 1){
      $('.histories-trading').addClass('hidden');
      $('.histories-title__trading').removeClass('active');
      $('.histories-past-trading').removeClass('hidden');
      $('.histories-title__past-trading').addClass('active');
    }
  });
});