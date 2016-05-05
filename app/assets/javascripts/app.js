var app = {
  map: {},
  marker: {}
}

$(function() {
  // $('#game_date').datepicker();
  $('#game_time').timepicker({ 'scrollDefault': 'now', 'minTime': '6:00am', 'maxTime': '10:00pm' });

  if (document.getElementById('map') !== null) {
    app.map.controller.initMap();
  }

  $('#court-select option').click(function() {
    var court_id = $(this).val();
    $.ajax({
      url: '/showmarker',
      data: {id: court_id}
    }).success(function(data) {
      var address = data.address;
      app.marker.controller.initMarker(address)
    });
  });
})