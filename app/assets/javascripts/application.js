// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

var date_picker;
var dateNow = new Date();
date_picker = function () {
    manual_date_enter_block('datepicker')
    $('[data-behaviour~=datepicker]').datetimepicker({
        format: "YYYY-MM-DD",
        defaultDate:dateNow
    });
};
$(document).ready(date_picker);
$(document).on('turbolinks:load', date_picker);

var month_picker;
month_picker = function () {
    manual_date_enter_block('monthpicker')
    $('[data-behaviour~=monthpicker]').datetimepicker({
        format: "MM-YYYY",
        defaultDate:dateNow

    });
};
$(document).ready(month_picker);
$(document).on('turbolinks:load', month_picker);

manual_date_enter_block = function(key){
  $('[data-behaviour~='+key+']').on('keypress', function(e) {
      e.preventDefault(); // Don't allow direct editing
  });
}
