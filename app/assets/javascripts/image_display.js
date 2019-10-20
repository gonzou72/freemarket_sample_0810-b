$(function () {
  $("#item_images_attributes_0_image").on("change",function(){
    var src = $(this).children('img').attr('src');
    console.log(src);
  });
});
