$(document).ready(function() {
    $('.search_form').submit(function() {
       var first_station;
       var last_station;

       first_station = $(this).find('#first_station_id');
       last_station = $(this).find('#last_station_id');

       if (first_station.val() == last_station.val()) {
          console.log(first_station.val());
          console.log(last_station.val());
          alert('Выберите конечную станцию');
          return false;
       }
    });
});