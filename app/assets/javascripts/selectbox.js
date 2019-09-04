$(function () {
  $(".display").change(function() { 
    var val=$(this).val();
    if (val=="レディース"){
      $(".rady").css("display","block");
    };
    if (val=="メンズ"){
      $(".man").css("display","block");
    };
    if (val=="ベビー・キッズ"){
      $(".baby").css("display","block");
    };
    if (val=="インテリア・住まい・小物"){
      $(".interia").css("display","block");
    };
    if (val=="本・音楽・ゲーム"){
      $(".book").css("display","block");
    };
    if (val=="おもちゃ・ホビー・グッズ"){
      $(".toy").css("display","block");
    };
    if (val=="コスメ・香水・美容"){
      $(".cosme").css("display","block");
    };
    if (val=="家電・スマホ・カメラ"){
      $(".camera").css("display","block");
    };
    if (val=="スポーツ・レジャー"){
      $(".sports").css("display","block");
    };
    if (val=="ハンドメイド"){
      $(".handmade").css("display","block");
    };
    if (val=="チケット"){
      $(".ticket").css("display","block");
    };
    if (val=="自動車・オートバイ"){
      $(".car").css("display","block");
    };
    if (val=="その他"){
      $(".others").css("display","block");
    };
  });
  $(".hidden_one").change(function() { 
    var val=$(this).val();
    if(val =="トップス(レディース)"){
      $(".rady_one").css("display","block");
    };
    if(val =="ジャケット/アウター(レディース)"){
      $(".rady_two").css("display","block");
    };
    if(val =="パンツ(レディース)"){
      $(".rady_three").css("display","block");
    };
    if(val =="スカート(レディース)"){
      $(".rady_four").css("display","block");
    };
    if(val =="ワンピース(レディース)"){
      $(".rady_five").css("display","block");
    };
    if(val =="靴(レディース)"){
      $(".rady_six").css("display","block");
    };
    if(val =="ルームウェア/パジャマ(レディース)"){
      $(".rady_seven").css("display","block");
    };
    if(val =="レッグウェア(レディース)"){
      $(".rady_eight").css("display","block");
    };
    if(val =="帽子(レディース)"){
      $(".rady_nine").css("display","block");
    };
    if(val =="バッグ(レディース)"){
      $(".rady_ten").css("display","block");
    };
    if(val =="アクセサリー(レディース)"){
      $(".rady_eleven").css("display","block");
    };
    if(val =="ヘアアクセサリー(レディース)"){
      $(".rady_twelve").css("display","block");
    };
    if(val =="小物(レディース)"){
      $(".rady_thriteen").css("display","block");
    };
    if(val =="時計(レディース)"){
      $(".rady_fourteen").css("display","block");
    };
    if(val =="ウィッグ/エクステ(レディース)"){
      $(".rady_fifteen").css("display","block");
    };
    if(val =="浴衣/水着(レディース)"){
      $(".rady_sixteen").css("display","block");
    };
    if(val =="スーツ/フォーマル/ドレス(レディース)"){
      $(".rady_seventeen").css("display","block");
    };
    if(val =="マタニティー(レディース)"){
      $(".rady_eighteen").css("display","block");
    };
    if(val =="その他(レディース)"){
      $(".rady_nineteen").css("display","block");
    };
    if(val =="トップス(メンズ)"){
      $(".man_one").css("display","block");
    };
    if(val =="ジャケット/アウター(メンズ)"){
      $(".man_two").css("display","block");
    };
    if(val =="パンツ(メンズ)"){
      $(".man_three").css("display","block");
    };
    if(val =="靴(メンズ)"){
      $(".man_four").css("display","block");
    };
    if(val =="バッグ(メンズ)"){
      $(".man_five").css("display","block");
    };
    if(val =="スーツ(メンズ)"){
      $(".man_six").css("display","block");
    };
    if(val =="帽子(メンズ)"){
      $(".man_seven").css("display","block");
    };
    if(val =="アクセサリー(メンズ)"){
      $(".man_eight").css("display","block");
    };
    if(val =="小物(メンズ)"){
      $(".man_nine").css("display","block");
    };
    if(val =="時計(メンズ)"){
      $(".man_ten").css("display","block");
    };
    if(val =="水着(メンズ)"){
      $(".man_eleven").css("display","block");
    };
    if(val =="レッグウェア(メンズ)"){
      $(".man_twelve").css("display","block");
    };
    if(val =="アンダーウェア(メンズ)"){
      $(".man_thirteen").css("display","block");
    };
    if(val =="その他(メンズ)"){
      $(".man_fourteen").css("display","block");
    };
    if(val =="ベビー服(女の子用)~95cm"){
      $(".baby_one").css("display","block");
    };
    if(val =="ベビー服(男の子用)~95cm"){
      $(".baby_two").css("display","block");
    };
    if(val =="ベビー服(男女兼用)~95cm"){
      $(".baby_three").css("display","block");
    };
    if(val =="ベビー服(女の子用)100cm~"){
      $(".baby_four").css("display","block");
    };
    if(val =="ベビー服(男の子用)100cm~"){
      $(".baby_five").css("display","block");
    };
    if(val =="ベビー服(男女兼用)100cm~"){
      $(".baby_six").css("display","block");
    };
    if(val =="キッズ靴"){
      $(".baby_seven").css("display","block");
    };
    if(val =="子ども用ファッション小物"){
      $(".baby_eight").css("display","block");
    };
    if(val =="おむつ/トイレ/バス"){
      $(".baby_nine").css("display","block");
    };
    if(val =="外出/移動用品"){
      $(".baby_ten").css("display","block");
    };
    if(val =="授乳/食事"){
      $(".baby_eleven").css("display","block");
    };
    if(val =="ベビー家具/寝具/室内用品"){
      $(".baby_twelve").css("display","block");
    };
    if(val =="おもちゃ"){
      $(".baby_thirteen").css("display","block");
    };
    if(val =="行事/記念品"){
      $(".baby_fourteen").css("display","block");
    };
    if(val =="その他(キッズ)"){
      $(".baby_fifteen").css("display","block");
    };
    if(val =="キッチン/食器"){
      $(".interia_one").css("display","block");
    };
    if(val =="ベッド/マットレス"){
      $(".interia_two").css("display","block");
    };
    if(val =="ソファ/ソファベッド"){
      $(".interia_three").css("display","block");
    };
    if(val =="椅子/チェア"){
      $(".interia_four").css("display","block");
    };
    if(val =="机/テーブル"){
      $(".interia_five").css("display","block");
    };
    if(val =="収納家具"){
      $(".interia_six").css("display","block");
    };
    if(val =="ラグ/カーペット/マット"){
      $(".interia_seven").css("display","block");
    };
    if(val =="カーテン/ブラインド"){
      $(".interia_eight").css("display","block");
    };
    if(val =="ライト/照明"){
      $(".interia_nine").css("display","block");
    };
    if(val =="寝具"){
      $(".interia_ten").css("display","block");
    };
    if(val =="インテリア小物"){
      $(".interia_eleven").css("display","block");
    };
    if(val =="季節/年中行事"){
      $(".interia_twelve").css("display","block");
    };
    if(val =="その他(インテリア)"){
      $(".interia_thirteen").css("display","block");
    };
    
  });
  $(".size_open").change(function() {
    var val=$(this).val();
      $('.hidden_size').css("display","block");
      $('.detail__contents .side').css("display","inline-block");
    if(val == "浴衣" || val == "着物" || val == "振袖" || val == "長袖袴/半袖袴"){
      $('.hidden_size').css("display","none");
    };
  });
  $(".hidden_two").change(function() {
    $('.hidden_bland').css("display","block");
    $('.detail__contents .side').css("display","inline-block");
  });

  $("#hidden_way").change(function() {
    var val=$(this).val();
    if(val=="送料込み"){
      $('.way_departure').css("display","inline-block");
    };
    if(val=="着払い"){
      $('.way_arrival').css("display","inline-block");
    };
  });
});