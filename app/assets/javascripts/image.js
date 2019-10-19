$(function () {
  function append(index){
    var append=`<label for="item_images_attributes_${index+1}_image">
                      <input type="file" name="item[images_attributes][${index+1}][image]" id="item_images_attributes_${index+1}_image">
                      <i class="fa fa-camera camera-icon"></i>
                    </label>`
    $("#image_field").append(append);
  };

  i=["0","1","2","3","4","5","6","7","8"];

  $.each(i,function(index){
    $(document).on("change","#item_images_attributes_" + index + "_image",function() { 
      $("#item_images_attributes_" + index + "_image").css("display","none")
      $(".camera-icon").css("display","none")
      append(index);
    });
  });
  $(function(){
    for (var i = 0; i < 10; i++) {
      if($("#item_images_attributes_" + i + "_id").length){
        $("#item_images_attributes_" + i + "_image").css("display","none")
        $(".camera-icon").css("display","none")
      } else {
        if (i == 0){
        }else{
        append(i);
        }
        break;
      };
    };
  });
});
