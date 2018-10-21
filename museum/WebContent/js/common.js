/*
document.addEventListener('DOMContentLoaded', () => {
  var gnbWrap = document.querySelector('#gnbWrap')
  var gnb = document.querySelector('#gnb')
  var sub_inside = document.querySelector('.sub_inside')
  gnb.addEventListener('mouseover', evt => {
    sub_inside.classList.remove('on');
  });
  gnbWrap.addEventListener('mouseleave', evt => {
    sub_inside.classList.add('on');
  });
});
*/
// gnb mouseover
$(function() {
  var gnb = $('#gnb');
  var gnbWrap = $('#gnbWrap');
  var menu = $('.sub_inside');
  gnb.mouseover(function() {
    menu.stop().slideDown(400);
  });
  gnbWrap.mouseleave(function() {
    menu.stop().slideUp(400);
  });

  // 버튼 클릭시 해당 경로로 이동
  $('#sel_btn').click(function(e) {
    var url = $('#sel_box option:selected').val()
    location.href = url;
  });

  // 버튼 클릭시 일정 팝업 창
  $('#btnOpenLayer').click(function(e) {
    $('.plan_layer').toggleClass('on');
  });

});
