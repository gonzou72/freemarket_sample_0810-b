$(function () {
  $(".side_cost").change(function() { 
    var val =$('input[name=cost]').val();
    if(val>=300){
    var fee=val*0.1
    var benefit=val-fee
    $(".side_fee").text(fee);
    $(".side_benefit").text(benefit);
    }
    else{
      $(".sale__error").css("visibility","visible");
    };
  });
});