$(document).on('page:change', function() {

  // This function is used to allow for endless scrolling (easier browsing on mobile devices)

  var loadingThreshold = 50;
  var loadingWaitMsg = "Loading...";

  $(window).scroll(function () {
    var url = $('.pagination .next').find('a:first').attr('href');

    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - loadingThreshold) {
      $('.pagination').text(loadingWaitMsg);
      $.getScript(url);
    }
  });

  // This function is used to add a chevron indicator to Bootstrap accordion components

  function toggleChevron(e) {
    var t = $(e.target);
    var p = t.prev();
    var i = p.find("i.indicator");
    i.toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
  }
  
});