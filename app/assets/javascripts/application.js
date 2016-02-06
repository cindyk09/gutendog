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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require plugins/jquery.min
//= require plugins/modernizr
//= require plugins/rs-plugin/js/jquery.themepunch.tools.min
//= require plugins/rs-plugin/js/jquery.themepunch.revolution.min
//= require plugins/isotope/isotope.pkgd.min
//= require plugins/owl-carousel/owl.carousel
//= require plugins/magnific-popup/jquery.magnific-popup.min
//= require plugins/jquery.appear
//= require plugins/jquery.countTo
//= require plugins/jquery.parallax-1.1.3
//= require plugins/jquery.validate
//= require plugins/jquery.browser
//= require plugins/SmoothScroll
//= require template
//= require custom
//= require_tree .

$( document ).on('ready page:load', function () {
  $('.user-info').on('click', function () {
      $('#show-peronal-info').toggle('slow', function () {
      });
    });
});
