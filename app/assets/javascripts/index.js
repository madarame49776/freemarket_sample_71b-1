$(function() {
  $(".right-category").hover(function() {
    $("ul.category1").toggle();
  });
  $(".right-category li ul").hide();
  $(".right-category li").hover(function() {
      $(">ul:not(:animated)", this).stop(true, true).slideDown("fast");
      $("a", this).addClass("active");
  },function() {
      $(">ul:not(:animated)", this).stop(true, true).slideUp("fast");
      $("a", this).removeClass("active");
    });
});