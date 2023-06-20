/*global Swiper*/
// Swiperのオプションを定数化
const opt = {

  fadeEffect: {
    crossFade: true,
  },

  loop: true,
  loopAdditionalSlides: 1,
  speed: 2000,
  autoplay: {
    delay: 4000,
    disableOnInteraction: false,
    waitForTransition: false,
  },
  pagination: {
    el: '.swiper-pagination',
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }
}
/*global $*/
// Swiperを実行(初期化)
$(document).on('turbolinks:load', function() {
    let swiper = new Swiper('.swiper',opt);
});