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
//= require turbolinks
//= require_tree .


// This function is used to allow for endless scrolling (easier browsing on mobile devices)

var loadingThreshold = 50;
var loadingWaitMsg = "Loading...";

$(document).ready(function () {
  $(window).scroll(function () {
    var url = $('.pagination .next').find('a:first').attr('href');

    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - loadingThreshold) {
      $('.pagination').text(loadingWaitMsg);
      $.getScript(url);
    }
  });
});
