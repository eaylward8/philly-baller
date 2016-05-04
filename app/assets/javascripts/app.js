$(function() {
  // $('#game_date').datepicker();
  $('#game_time').timepicker({ 'scrollDefault': 'now', 'minTime': '6:00am', 'maxTime': '10:00pm' });

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.9526, lng: -75.1652},
    zoom: 11
  });
})