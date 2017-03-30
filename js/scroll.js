$(window).scroll (function() {
    if($(window).scrollTop() > 0) {
        $('.navbar').addClass('navbar-shadow');
    }
    else if (!$('#navbar').hasClass('in')) {
        $('.navbar').removeClass('navbar-shadow');
    }
});

function btt() {
  if ($(window).height() < $(document).height()) {
    $('.btt').css( 'display', 'block');
  }
  else {
    $('.btt').css( 'display', 'none');
  }
}
$(window).resize(btt);
$(document).ready(btt);

$(function() {
    $('.navbar-toggle').on('click', function() {
      if (!$('#navbar').hasClass('in')) {
          $('.navbar').addClass('navbar-shadow');
      } else {
        if($(window).scrollTop() == 0) {
          $('.navbar').removeClass('navbar-shadow');
        }
      }
    });

    function stripTrailingSlash(str) {
      if(str.substr(-1) == '/') {
        return str.substr(0, str.length - 1);
      }
      return str;
    }

    var url = window.location.pathname;
    var activePage = stripTrailingSlash(url);

    $('.nav li a').each(function(){
      var currentPage = stripTrailingSlash($(this).attr('href'));

      if (activePage == currentPage) {
        $(this).parent().addClass('active');
      }
    });
});

$(document.links).filter(function() {
    return this.hostname != window.location.hostname;
}).attr('target', '_blank');

$('a.page-scroll').bind('click', function(event) {
    $('html, body').stop().animate({
        scrollTop: ($($(this).attr('href')).offset().top)
    }, 1250, 'easeInOutExpo');
    event.preventDefault();
});
