// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function() {$(document).foundation(); });


$(function(){  

  $('#submitButton').on("click", function(){
    document.getElementById("submitButton").style.display='none'
    $("#numberOfCode").attr("type", "hidden");

    $("body").animate({
        "scrollTop": $('.content').offset().top
    }, 2000, function(){
        // .setUp(size);
    });
  })   
  
}); 
