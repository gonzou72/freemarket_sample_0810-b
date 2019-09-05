$(function () {
  $(".display").change(function() { 
    var val=$(this).val();
    $(val).css("display","block");
  });
  $(".hidden_one").change(function() { 
    var val=$(this).val();
      $(val).css("display","block");
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
    $('.hidden_bland').css("display","inline-block");
  });

  $("#hidden_way").change(function() {
    var val=$(this).val();
      $(val).css("display","inline-block");
  });
});