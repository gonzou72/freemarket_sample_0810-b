$(function () {
  $('span,.droplist').mouseover(function() { 
    if ($(this).attr('class') == 'selected') {
      // メニュー非表示
      $(this).removeClass('selected').next('ul').slideUp(1);
    } else {
      // 表示しているメニューを閉じる
      $('span').removeClass('selected');
      $('.dropdown').hide(1);

      // メニュー表示
      $(this).addClass('selected').next('ul').slideDown(1);

    }    
  });
  
  // マウスカーソルがメニュー上/メニュー外
  $('.bottom__left,.bottom__right').hover(function(){
    over_flg = true;
  }, function(){
    over_flg = false;
  });  
  
  // メニュー領域外をクリックしたらメニューを閉じる
  $('.bottom__left,.bottom__right').mouseout(function() {
    if (over_flg == false) {
      $('span').removeClass('selected');
      $('.dropdown').slideUp(1);
    }
  });
});