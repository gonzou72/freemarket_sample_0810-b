$(document).ready(function(){
  $(".slide-top").slick({
    dots: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay:true,
    autoplaySpeed:300,
    accessibility: true,
    pauseOnFocus: false,
    pauseOnHover: false,
    pauseOnDotsHover: false
  });
});