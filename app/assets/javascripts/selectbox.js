$(function () {
  function append(){
    var append = `<select id="hidden_one" name="item[category_id]">
                    <option value="">---</option>
                  </select>
                `
    $("#append").append(append);
  }
  function choice(child){
    for (var i=1; i<child.length; i++){
      var choice = `<option value="${child[i].id}">${child[i].name}</option>
                    `
      $("#hidden_one").append(choice);
    }
  }
  function append_two(){
    var append_two = `<select id="hidden_two" name="item[category_id]">
                    <option value="">---</option>
                  </select>`
    $("#append_two").append(append_two);
  }
  function choice_two(child){
    for (var i=1; i<child.length; i++){
      var choice = `<option value="${child[i].id}">${child[i].name}</option>
                    `
      $("#hidden_two").append(choice);
    }
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
      append();
      choice(children);
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
    .done(function(children_two){
      $("#append_two").empty();
      append_two();
      choice_two(children_two);
    })
    .fail(function(){
      $(".detail__contents--type").text("fail")
    })
  });
  $("#append_two").change(function() {
    var val=$(this).val();
      $('.hidden_size').css("display","block");
      $('.detail__contents .side').css("display","inline-block");
    if(val == "浴衣" || val == "着物" || val == "振袖" || val == "長袖袴/半袖袴"){
      $('.hidden_size').css("display","none");
    };
  });
  $("#append_two").change(function() {
    $('.hidden_bland').css("display","inline-block");
  });

  $("#item_shipping_fee").change(function() {
    var val=$(this).val();
    if (val == "送料込み(出品者負担)"){
      $(".way_arrival").css("display","none");
      $(".way_departure").css("display","inline-block");
    }
    if (val == "着払い(購入者負担)"){
      $(".way_departure").css("display","none");
      $(".way_arrival").css("display","inline-block");
    }
  });
});