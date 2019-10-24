$(function () {

  i=["0","1","2","3","4","5","6","7","8","9"];

  $.each(i,function(index){
    $(document).on("change","#item_images_attributes_" + index + "_image",function() { 
      $("#item_images_attributes_" + index + "_image").css("display","none")
      $(".camera-icon").css("display","none")
      var files = $(this).prop('files');
      var file = files[0];
      var fr = new FileReader();
      fr.onload = function(e){
        var src = e.target.result;
        var img =`<img src="${src}" id="image_${index}" height=78px width=70px>
                    <label for="item_images_attributes_${index+1}_image" id="image_field">
                      <input type="file" name="item[images_attributes][${index+1}][image]" id="item_images_attributes_${index+1}_image">
                      <i class="fa fa-camera camera-icon"></i>
                    </label>`;
        $("#preview").append(img);
      }
      fr.readAsDataURL(file);
      $("#preview").css({
        "display":"block",
        "height":"0",
      });
      $("#item_images_attributes_1_image").css({
        "position":"relative",
      });
      if (index == 9){
        $("#item_images_attributes_10_image").css("display","none")
      }  
    });
  });
  $(document).on("mouseover","#image_0",function(){
    console.log("ffff")
  });  

  $(function(){
    for (var i = 0; i < 10; i++) {
      if($("#item_images_attributes_" + i + "_id").length){
        $("#item_images_attributes_" + i + "_image").css("display","none")
        $(".camera-icon").css("display","none")
      } else {
        if (i != 0){
        append(i);
        }
        break;
      };
    };
  });
});
