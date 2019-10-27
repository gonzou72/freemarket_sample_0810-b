$(function () {
  function append(){
    var append = `<select id = "hidden_one" name = "item[category_id]">
                  <option value = "">---</option>
                  </select>`
    $("#append").append(append);
  }
  function choice(child){
    for (var i = 0; i<child.length; i++){
      var choice = `<option value="${child[i].id}">${child[i].name}</option>
                    `
      $("#hidden_one").append(choice);
    }
  }
  function append_two(){
    var append_two = `<select id = "hidden_two" name = "item[category_id]">
                    <option value = "">---</option>
                  </select>`
    $("#append_two").append(append_two);
  }
  function choice_two(child){
    for (var i = 0; i<child.length; i++){
      var choice = `<option value="${child[i].id}">${child[i].name}</option>
                    `
      $("#hidden_two").append(choice);
    }
  }

  function size_clothes(){
    var size_clothes = `<div class = "detail__contents--type side">
                          サイズ
                        </div>
                        <div class = "detail__contents--btn side">
                          必須
                        </div>
                        <select name = "item[size]" id = "item_size" class="detail__contents--content">
                          <option value = "">---</option>
                          <option value = "XXS以下">XXS以下</option>
                          <option value = "XS(SS)">XS(SS)</option>
                          <option value = "S">S</option>
                          <option value = "M">M</option>
                          <option value = "L">L</option>
                          <option value = "XL(LL)">XL(LL)</option>
                          <option value = "2XL(3L)">2XL(3L)</option>
                          <option value = "3XL(4L)">3XL(4L)</option>
                          <option value = "4XL(5L)以上">4XL(5L)以上</option>
                          <option value = "FREE SIZE">FREE SIZE</option>
                        </select>`
    $("#hidden_size").append(size_clothes);
  }

  function size_shoes(){
    var size_shoes =`<div class = "detail__contents--type side">
                        サイズ
                      </div>
                      <div class = "detail__contents--btn side">
                        必須
                      </div>
                      <select name = "item[size]" id = "item_size" class = "detail__contents--content">
                        <option value = "">---</option>
                        <option value = "23.5cm以下">23.5cm以下</option>
                        <option value = "24cm">24cm</option>
                        <option value = "24.5cm">24.5cm</option>
                        <option value = "25cm">25cm</option>
                        <option value = "25.5cm">25.5cm</option>
                        <option value = "26cm">26cm</option>
                        <option value = "26.5cm">26.5cm</option>
                        <option value = "27cm">27cm</option>
                        <option value = "27.5cm">27.5cm</option>
                        <option value = "28cm">28cm</option>
                        <option value = "28.5cm">28.5cm</option>
                        <option value = "29cm">29cm</option>
                        <option value = "29.5cm">29.5cm</option>
                        <option value = "30cm">30cm</option>
                        <option value = "30.5cm">30.5cm</option>
                        <option value = "31cm以上">31cm以上</option>
                      </select>`
    $("#hidden_size").empty();
    $("#hidden_size").append(size_shoes);
  }
  function delivery_one(){
    var delivery_one =`<div class = "delivery__contents--type side">
                        配送の方法
                      </div>
                      <div class = "delivery__contents--btn side">
                        必須
                      </div>
                      <select name = "item[shipping_method]" id = "item_shipping_method">
                        <option value = "">---</option>
                        <option value = "未定">未定</option>
                        <option value = "らくらくメルカリ便">らくらくメルカリ便</option>
                        <option value = "ゆうメール">ゆうメール</option>
                        <option value = "レターパック">レターパック</option>
                        <option value = "普通郵便(定形,定形外)">普通郵便(定形,定形外)</option>
                        <option value = "クロネコヤマト">クロネコヤマト</option>
                        <option value = "らくらくメルカリ便">らくらくメルカリ便</option>
                        <option value = "ゆうパック">ゆうパック</option>
                        <option value = "クリップポスト">クリップポスト</option>
                        <option value = "ゆうパケット">ゆうパケット</option>
                      </select>`
    $(".delivery_way").append(delivery_one);
  }
  function delivery_two(){
    var delivery_two =`<div class = "delivery__contents--type side">
                        配送の方法
                      </div>
                      <div class = "delivery__contents--btn side">
                        必須
                      </div>
                      <select name = "item[shipping_method]" id = "item_shipping_method">
                        <option value = "">---</option>
                        <option value = "未定">未定</option>
                        <option value = "クロネコヤマト">クロネコヤマト</option>
                        <option value = "ゆうパック">ゆうパック</option>
                        <option value = "ゆうメール">ゆうメール</option>
                      </select>
                      `
    $(".delivery_way").append(delivery_two);
  }
  
  function exist_change(val){
    var d = $.Deferred();
    $.ajax({
      type:"GET",
      url:'/items/new',
      data:{
        parent_id:val
      },
      dataType:'json'
    })
    .done(function(children){
      $("#append").empty();
      append();
      choice(children);
      d.resolve();
    })
    .fail(function(){
      $(".detail__contents--type").text("fail")
    })
    return d.promise();
  };

  function appendchange(val){
    var d = $.Deferred();
    $.ajax({
      type:"GET",
      url:'/items/new',
      data:{
        parent_id_two:val
      },
      dataType:'json'
    })
    .done(function(children_two){
      $("#append_two").empty();
      append_two();
      choice_two(children_two);
      d.resolve();
    })
    .fail(function(){
      $(".detail__contents--type").text("fail")
    })
    return d.promise();
  };

  function append_two_change(val, val_two, val_three){
    var d = $.Deferred();
    $.ajax({
      type:"GET",
      url:'/items/new',
      data:{
        size: val,
        size_two: val_two,
        size_three: val_three
      },
      dataType:'json'
    })
    .done(function(size){
      $("#hidden_size").empty();
      size_clothes();
      if (size.id == "4"|| size.id == "5" || size.id == "6" || size.id == "7" || size.id == "8" || size.id == "9" || size.id == "10" || size.id == "11" || size.id == "12" || size.id == "13"){
        $("#hidden_size").empty();
      }
      if(size.id_two == "19" || size.id_two == "36" || size.id_two == "53"){
        size_shoes();
      }
      d.resolve();
    })
    .fail(function(){
      $(".delivery__title").text("fail")
    })
    return d.promise();
  };

  function shipping_free_change(val){
    var d = $.Deferred();
    $.ajax({
      type:"GET",
      url:'/items/new',
      data:{
        delivery:val
      },
      dataType:'json'
    })
    .done(function(delivery){
      $(".delivery_way").empty();
      if (delivery.way == "送料込み(出品者負担)"){
        delivery_one();
      }
      if(delivery.way == "着払い(購入者負担)"){
        delivery_two();
      }
      d.resolve();
    })
    .fail(function(){
      $(".delivery__title").text("fail")
    })
    return d.promise();
  };

  $("#exist").on("change",function() { 
    var val = document.getElementById("display").value;
    $("#append").empty();
    $("#append_two").empty();
    $("#hidden_size").empty();
    exist_change(val);
  });

  $("#append").on("change",function() { 
    var val = document.getElementById("hidden_one").value;
    $("#append_two").empty();
    $("#hidden_size").empty();
    appendchange(val);
  });

  $("#append_two").on("change",function() { 
    var val = document.getElementById("display").value;
    var val_two = document.getElementById("hidden_one").value;
    var val_three = document.getElementById("hidden_two").value;
    append_two_change(val, val_two, val_three);
  });

  $("#append_two").change(function() {
    $('.hidden_bland').css("display","inline-block");
  });

  $("#item_shipping_fee").on("change",function() { 
    var val = document.getElementById("item_shipping_fee").value;
    shipping_free_change(val);
  });

  function setting() {
    var category_child = $("#hidden-category-child").val();
    var shipping_free = $("#item_shipping_fee").val();

    if (category_child !== void 0){
      $.when()
        .then(function() {
          var category_parent = $("#hidden-category-parent").val();
          $("#display").val(category_parent);
          return exist_change(category_parent);
        })
        .then(function() {
          var category = $("#hidden-category").val();
          $("#hidden_one").val(category);
          return appendchange(category);
        })
        .then(function() {
          var category_parent = $("#hidden-category-parent").val();
          var category = $("#hidden-category").val();
          var category_child = $("#hidden-category-child").val();
          $("#hidden_two").val(category_child);
          return append_two_change(category_parent, category, category_child);
        })
        .then(function() {
          var size = $("#hidden-size-setting").val();
          $("#item_size").val(size);
          $('.hidden_bland').css("display","inline-block");
        })
    };
    if (shipping_free !== void 0){
      $.when()
        .then(function() {
          return shipping_free_change(shipping_free);
        })
        .then(function() {
          var shipping_method = $("#hidden-shipping_method").val();
          $("#item_shipping_method").val(shipping_method);
        })
    };
  };

  setting();
});
