$(function () {
  n=["0","1","2","3","4","5","6","7","8","9","10"];
  $.each(n,function(number){
    $(document).on("change","#item_images_attributes_" + number + "_image",function() { 
      var files = $(this).prop('files');
      var file = files[0];
      var fr = new FileReader();
      fr.onload = function(e){
        var src = e.target.result;
        var img ='<img src="'+ src +'" id="image_'+number+'">';
     $("#preview").append(img);
      }
      fr.readAsDataURL(file);
    });
  });
});
