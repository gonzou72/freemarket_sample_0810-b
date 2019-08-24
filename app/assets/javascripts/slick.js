$(document).ready(function(){
  $(".slide-top").slick({
    dots: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay:true,
    autoplaySpeed:3000,
    accessibility: true,
    pauseOnFocus: false,
    pauseOnHover: true,
    pauseOnDotsHover: true
  });
});