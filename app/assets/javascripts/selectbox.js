$(function () {
  function append(child){
    var append = `<select id="hidden_one" name="item[category_id]">
                    <option value="">---</option>
                    <option value="1">${child.id}</option>
                    <option value="2">メンズ</option>
                    <option value="3">ベビー・キッズ</option>
                    <option value="4">インテリア・住まい・小物</option>
                    <option value="5">本・音楽・ゲーム</option>
                    <option value="6">おもちゃ・ホビー・グッズ</option>
                    <option value="7">コスメ・香水・美容</option>
                    <option value="8">家電・スマホ・カメラ</option>
                    <option value="9">スポーツ・レジャー</option>
                    <option value="10">ハンドメイド</option>
                    <option value="11">チケット</option>
                    <option value="12">自動車・オートバイ</option>
                    <option value="13">その他</option></select>
                  </select>`
    $("#append").append(append);
  }
  function append_two(child_two){
    var append = `<select id="hidden_two" name="item[category_id]">
                    <option value="">---</option>
                    <option value="1">${child_two.id}</option>
                    <option value="2">メンズ</option>
                    <option value="3">ベビー・キッズ</option>
                    <option value="4">インテリア・住まい・小物</option>
                    <option value="5">本・音楽・ゲーム</option>
                    <option value="6">おもちゃ・ホビー・グッズ</option>
                    <option value="7">コスメ・香水・美容</option>
                    <option value="8">家電・スマホ・カメラ</option>
                    <option value="9">スポーツ・レジャー</option>
                    <option value="10">ハンドメイド</option>
                    <option value="11">チケット</option>
                    <option value="12">自動車・オートバイ</option>
                    <option value="13">その他</option></select>
                  </select>`
    $("#append_two").append(append);
  }
  $("#exist").on("change",function() { 
    var parentValue = document.getElementById("display").value;
    $.ajax({
      type:"GET",
      url:'/items/new',
      data:{
        parent_id:parentValue
      },
      dataType:'json'
    })
    .done(function(children){
      $("#append").empty();
      append(children);
      debugger;
    })
    .fail(function(){
      $(".detail__contents--type").text("fail")
    })
  });
  $("#append").on("change",function() { 
    var parentValue_two = document.getElementById("hidden_one").value;
    $.ajax({
      type:"GET",
      url:'/items/new',
      data:{
        parent_id_two:parentValue_two
      },
      dataType:'json'
    })
    binding.pry
    .done(function(child_two){
      $("#append_two").empty();
      append_two(child_two);
    })
    .fail(function(){
      $(".detail__contents--type").text("fail")
    })
  });
  // $(".size_open").change(function() {
  //   var val=$(this).val();
  //     $('.hidden_size').css("display","block");
  //     $('.detail__contents .side').css("display","inline-block");
  //   if(val == "浴衣" || val == "着物" || val == "振袖" || val == "長袖袴/半袖袴"){
  //     $('.hidden_size').css("display","none");
  //   };
  // });
  // $(".hidden_two").change(function() {
  //   $('.hidden_bland').css("display","inline-block");
  // });

  // $("#hidden_way").change(function() {
  //   var val=$(this).val();
  //     $(val).css("display","inline-block");
  // });
});