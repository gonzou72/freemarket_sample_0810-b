$(function () {
  function append_one(){
    var append_one=`<label for="item_images_attributes_1_image">
                      <input type="file" name="item[images_attributes][1][image]" id="item_images_attributes_1_image">
                      <i class="fa fa-camera camera-icon"></i>
                    </label>`
    $("#image_field").append(append_one);
  };
  $("#item_images_attributes_0_image").on("change",function() { 
    $("#item_images_attributes_0_image").css("display","none")
    $(".camera-icon").css("display","none")
    append_one();
  });
  function append_two(){
    var append_two=`<label for="item_images_attributes_2_image">
                      <input type="file" name="item[images_attributes][2][image]" id="item_images_attributes_2_image">
                      <i class="fa fa-camera camera-icon"></i>
                    </label>`
    $("#image_field").append(append_two);
  };
  $(document).on("change","#item_images_attributes_1_image",function() { 
    $("#item_images_attributes_1_image").css("display","none")
    $(".camera-icon").css("display","none")
    append_two();
  });
  function append_three(){
    var append_three=`<label for="item_images_attributes_3_image">
                  <input type="file" name="item[images_attributes][3][image]" id="item_images_attributes_3_image">
                  <i class="fa fa-camera camera-icon"></i>
                </label>`
    $("#image_field").append(append_three);
  };
    $(document).on("change","#item_images_attributes_2_image",function() { 
    $("#item_images_attributes_2_image").css("display","none")
    $(".camera-icon").css("display","none")
    append_three();
  });
  function append_four(){
    var append_four=`<label for="item_images_attributes_4_image">
                  <input type="file" name="item[images_attributes][4][image]" id="item_images_attributes_4_image">
                  <i class="fa fa-camera camera-icon"></i>
                </label>`
    $("#image_field").append(append_four);
  };
    $(document).on("change","#item_images_attributes_3_image",function() { 
    $("#item_images_attributes_3_image").css("display","none")
    $(".camera-icon").css("display","none")
    append_four();
  });
  function append_five(){
    var append_five=`<label for="item_images_attributes_5_image">
                  <input type="file" name="item[images_attributes][5][image]" id="item_images_attributes_5_image">
                  <i class="fa fa-camera camera-icon"></i>
                </label>`
    $("#image_field").append(append_five);
  };
    $(document).on("change","#item_images_attributes_4_image",function() { 
    $("#item_images_attributes_4_image").css("display","none")
    $(".camera-icon").css("display","none")
    append_five();
  });
});
