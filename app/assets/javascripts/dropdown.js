$(function () {
  $('span').mouseover(function() { 
    if ($(this).attr('class') == 'selected') {
      // メニュー非表示
      $(this).removeClass('selected').next('ul').slideUp('fast');
    } else {
      // 表示しているメニューを閉じる
      $('span').removeClass('selected');
      $('.dropdown').hide(10);

      // メニュー表示
      $(this).addClass('selected').next('ul').slideDown('fast');

    }    
  });
  
  // マウスカーソルがメニュー上/メニュー外
  $('.bottom__left').hover(function(){
    over_flg = true;
  }, function(){
    over_flg = false;
  });  
  
  // メニュー領域外をクリックしたらメニューを閉じる
  $('.bottom__left').mouseout(function() {
    if (over_flg == false) {
      $('span').removeClass('selected');
      $('.dropdown').slideUp(10);
    }
  });
});