$(function(){
// ナビゲーションメニュー用。現在のパスからリンクバーの色変更とactiveクラスを付与
  var $pass = $(location).attr('pathname');
  $('.navigation-bar a[href="'+$pass+'"] li').addClass('active').css({
    backgroundColor: 'lightgray'
  });
  $('.navigation-bar .active .type__icon').css({
    color: 'black'
  });

// ホバーで背景と矢印の色変更(activeクラスを持っている場合は適応されない。)
  $('.navigation-bar li, .information-content, .histories-content, .histories-last__link-btn, .information-last__link-btn').hover(function(){
    if($(this).hasClass('active')){
    }else{
      $(this).css({
        backgroundColor: 'ghostwhite'
      });
      $(this).find('.type__icon').css({
        color: 'black'
      });
    }
  }, function(){
    if($(this).hasClass('active')){
    }else{
      $(this).css({
        backgroundColor: ''
      });
      $(this).find('.type__icon').css({
        color: '',
      });
    }
  });
// ホバーで矢印が少し右に動く。（ナビゲーションメニュー）
  $('.navigation-bar li').hover(function(){    
    $(this).find('.type__icon').not(":animated").animate({
      'marginRight': '7px' }, {'duration': 200
    });
  }, function(){
    $(this).find('.type__icon').animate({
      'marginRight': '10px'}, {'duration': 200
    });
  });
// ホバーでフォントカラー変更（マイページのトップページ）
  $('.information-title li, .histories-title li').hover(function(){    
    $(this).css({
      color: 'gray'
    });
  }, function(){
    $(this).css({
      color: ''
    });
  });

});