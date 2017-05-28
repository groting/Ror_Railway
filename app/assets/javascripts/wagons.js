$(document).ready(function() {
    $('.wagon_type_select').change(function() {


    var selected_value;

    selected_value = $(this).val();
    switch (selected_value){
      case 'FirstClassWagon': 
        $(top_seats).hide();
        $(bottom_seats).show();
        $(side_top_seats).hide();
        $(side_bottom_seats).hide();
      case 'SecondClassWagon': 
        $(top_seats).show();
        $(bottom_seats).show();
        $(side_top_seats).hide();
        $(side_bottom_seats).hide();
      case 'ThirdClassWagon':
        $(top_seats).show();
        $(bottom_seats).show();
        $(side_top_seats).show();
        $(side_bottom_seats).show();
      case 'CouchWagon': 
        $(top_seats).hide();
        $(bottom_seats).show();
        $(side_top_seats).hide();
        $(side_bottom_seats).hide();
    }
  });
})
