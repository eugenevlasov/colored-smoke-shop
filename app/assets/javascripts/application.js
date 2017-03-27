// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require foundation
//= require foundation.core.js
// require foundation.abide.js
// require foundation.accordion.js
// require foundation.accordionMenu.js
// require foundation.drilldown.js
//= require foundation.dropdown.js
// require foundation.dropdownMenu.js
// require foundation.equalizer.js
// require foundation.interchange.js
// require foundation.magellan.js
// require foundation.offcanvas.js
// require foundation.orbit.js
//= require foundation.responsiveMenu.js
//= require foundation.responsiveToggle.js
//= require foundation.reveal.js
// require foundation.slider.js
// require foundation.sticky.js
// require foundation.tabs.js
//= require foundation.toggler.js
// require foundation.tooltip.js
//= require foundation.util.box.js
//= require foundation.util.keyboard.js
//= require foundation.util.mediaQuery.js
// require foundation.util.motion.js
//= require foundation.util.nest.js
//= require foundation.util.timerAndImageLoader.js
//= require foundation.util.touch.js
//= require foundation.util.triggers.js
// require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function() {
  setTimeout(function() {
    $("#flash .callout").trigger('close');
  }, 4000);

  $('tr[data-href]').on("click", function() {
    document.location = $(this).data('href');
  });
});
