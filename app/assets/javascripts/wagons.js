$(document).ready(function() {
    $('.wagon_type_select').change(function() {


    var selected_value;

    selected_value = $(this).val();
    if (selected_value == 'FirstClassWagon') {
      $(top_seats).hide();
      $(bottom_seats).show();
      $(side_top_seats).hide();
      $(side_bottom_seats).hide();
    } else if (selected_value == 'SecondClassWagon') {
      $(top_seats).show();
      $(bottom_seats).show();
      $(side_top_seats).hide();
      $(side_bottom_seats).hide();
    } else if (selected_value == 'ThirdClassWagon') {
      $(top_seats).show();
      $(bottom_seats).show();
      $(side_top_seats).show();
      $(side_bottom_seats).show();
    } else if (selected_value == 'CouchWagon') {
      $(top_seats).hide();
      $(bottom_seats).show();
      $(side_top_seats).hide();
      $(side_bottom_seats).hide();
    }
  });
})
