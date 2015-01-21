// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require bootsy
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require jquery.turbolinks
//= require skrollr
//= require skrollr.stylesheets
//= require_tree .


var ready = function(){
  $(".brand-mini").hide();
  $(".modal").hide();

  $(".post_data").click(function(){
    $(this).siblings('.modal').show();
  });
  $(".modal").click(function(){
    $(this).hide();
  })

};
$(document).ready(ready);
$(document).on('page:load', ready);

//Load More JS
var counter = 10;
function LoadMore() {
    counter = counter + 10;
}

function ShowLess() {
    counter = 10;
}
$(document).on("ready page:change", function () {
    $(".post_div:lt(10)").show();

    $(".less").click(function () {
        ShowLess();
        $('.post_div:gt(0)').hide();
        $(".post_div:lt(10)").show();
    });

    $(".load").click(function () {
        LoadMore();
        $('.post_div:lt("' + counter + '")').show();
    });

    var background=["#2ecc71","#1abc9c","#e74c3c","#e67e22","#f1c40f","#8e44ad"];
    var i=0;
    for(i=0;i<7;i++)
    {
      var j=Math.floor((Math.random() * 6) );
      $('.month'+i).css({'background':background[j]});
    }



});

$(window).scroll(function(){


  if ($(window).scrollTop() > 50){
    $(".navbar_main").addClass('navbar-fixed-top');
    $(".navbar_main").css('background-color','#FFF');
    $(".brand-mini").show();
  }
  else {
    $(".navbar_main").removeClass('navbar-fixed-top');
    $(".navbar_main").css('background-color','#f5f5f5');
    $(".brand-mini").hide();
  }
});
  

