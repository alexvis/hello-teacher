// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .


$(function(){ $(document).foundation(); });


$(document).ready(function(){
   $("#p").hide();
     $("#l").click(function(){
       $("#p").slideToggle("slow");
     });
   });


$(document).ready(function(){
 $(".option").hide();

 $([10,11,12,13,14,15,16,17,18,19]).each(function(i, e){
   $(`#${i}`).click(function(){
     $(`#${e}`).slideToggle("slow");
   });
 });
});
