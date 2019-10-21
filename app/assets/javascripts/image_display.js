$(function () {
  i=["0","1","2","3","4","5","6","7","8","9"];
  $.each(i,function(index){
    $(document).on("change","#item_images_attributes_" + index + "_image",function() { 
      var files = $(this).prop('files');
      var len = files.length;
      for ( var i = 0; i < len; i++ ){
        var file = files[i];
        var fr = new FileReader();
        fr.onload = function(e){
          var src = e.target.result;
          var img ='<img src="'+ src +'" height=77px width=70px>';
          $("#preview").append(img);
        }
        fr.readAsDataURL(file);
      }
      $('#preview').css({
        "display":"block",
      });
    });
  });
});
