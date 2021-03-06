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
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  // Hide the extra content initially, using JS so that if JS is disabled, no problemo:
  $('.read-more-content').addClass('hide')

  // Set up a link to expand the hidden content:
  .before('<a class="read-more-show" href="#">Read More</a>')

  // Set up a link to hide the expanded content.
  .append(' <a class="read-more-hide" href="#">Read Less</a>');

  // Set up the toggle effect:
  $('.read-more-show').on('click', function(e) {
    $(this).next('.read-more-content').removeClass('hide');
    $(this).addClass('hide');
    e.preventDefault();
  });

  $('.read-more-hide').on('click', function(e) {
    $(this).parent('.read-more-content').addClass('hide').parent().children('.read-more-show').removeClass('hide');
    e.preventDefault();
  });

});
