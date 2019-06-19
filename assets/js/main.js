/*!

 =========================================================
 * Material Kit - v2.0.5
 =========================================================

 * Product Page: https://www.creative-tim.com/product/material-kit
 * Copyright 2018 Creative Tim (http://www.creative-tim.com)

 * Designed by www.invisionapp.com Coded by www.creative-tim.com

 =========================================================

 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 */

 var navbar_menu_visible= 0;

 $(document).on('click', '.navbar-toggler', function() {
   $toggle = $(this);
   if (navbar_menu_visible == 1) {
     $('html').removeClass('nav-open');
     navbar_menu_visible = 0;
     $('#bodyClick').remove();
     setTimeout(function() {
       $toggle.removeClass('toggled');
     }, 550);
   } else {
     setTimeout(function() {
       $toggle.addClass('toggled');
     }, 580);
     div = '<div id="bodyClick"></div>';
     $(div).appendTo("body").click(function() {
       $('html').removeClass('nav-open');
       navbar_menu_visible = 0;
       $('#bodyClick').remove();
       setTimeout(function() {
         $toggle.removeClass('toggled');
       }, 550);
     });
     $('html').addClass('nav-open');
     navbar_menu_visible = 1;
   }
 });

// Toc
// https://github.com/ghiculescu/jekyll-table-of-contents
(function($){
 $.fn.toc = function(options) {
   var defaults = {
     noBackToTopLinks: false,
     title: '',
     minimumHeaders: 3,
     headers: 'h1, h2, h3, h4',
     listType: 'ol', // values: [ol|ul]
     showEffect: 'show', // values: [show|slideDown|fadeIn|none]
     showSpeed: 'slow' // set to 0 to deactivate effect
   },
   settings = $.extend(defaults, options);

   var headers = $(settings.headers).filter(function() {
     // get all headers with an ID
     var previousSiblingName = $(this).prev().attr( "name" );
     if (!this.id && previousSiblingName) {
       this.id = $(this).attr( "id", previousSiblingName.replace(/\./g, "-") );
     }
     return this.id;
   }), output = $(this);
   if (!headers.length || headers.length < settings.minimumHeaders || !output.length) {
     return;
   }

   if (0 === settings.showSpeed) {
     settings.showEffect = 'none';
   }

   var render = {
     show: function() { output.hide().html(html).show(settings.showSpeed); },
     slideDown: function() { output.hide().html(html).slideDown(settings.showSpeed); },
     fadeIn: function() { output.hide().html(html).fadeIn(settings.showSpeed); },
     none: function() { output.html(html); }
   };

   var get_level = function(ele) { return parseInt(ele.nodeName.replace("H", ""), 10); }
   var highest_level = headers.map(function(_, ele) { return get_level(ele); }).get().sort()[0];
   var return_to_top = '<i class="icon-arrow-up back-to-top"> </i>';

   var level = get_level(headers[0]),
     this_level,
     html = settings.title + " <"+settings.listType+">";
   headers.each(function(_, header) {
     var child = header.firstChild;
     $(child).on('click', function() {
       if (!settings.noBackToTopLinks) {
         window.location.hash = header.id;
       }
     });
     this_level = get_level(header);
     if (!settings.noBackToTopLinks && this_level === highest_level) {
       $(header).addClass('top-level-header').after(return_to_top);
     }
     if (this_level === level) // same level as before; same indenting
       html += "<li><a href='#" + header.id + "'>" + header.innerHTML + "</a>";
     else if (this_level <= level){ // higher level than before; end parent ol
       for(i = this_level; i < level; i++) {
         html += "</li></"+settings.listType+">"
       }
       html += "<li><a href='#" + header.id + "'>" + header.innerHTML + "</a>";
     }
     else if (this_level > level) { // lower level than before; expand the previous to contain a ol
       for(i = this_level; i > level; i--) {
         html += "<"+settings.listType+"><li>"
       }
       html += "<a href='#" + header.id + "'>" + header.innerHTML + "</a>";
     }
     level = this_level; // update for the next one
   });
   html += "</"+settings.listType+">";
   if (!settings.noBackToTopLinks) {
     $(document).on('click', '.back-to-top', function() {
       $(window).scrollTop(0);
       window.location.hash = '';
     });
   }

   render[settings.showEffect]();
 };
})(jQuery);

$(function() {
    // Add 'external' CSS class to all external links
    $('a:external').addClass('external');

    // turn target into target=_blank for elements w external class
    $(".external").attr('target', '_blank');
});

$.expr[':'].external = function(obj){
    return !obj.href.match(/^mailto\:/) && (obj.hostname != location.hostname);
};
