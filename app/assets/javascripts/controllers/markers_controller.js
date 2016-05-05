app.marker.controller = {
  initMarker: (function(address) {
    var map = app.map.model.currentMap;
    var service = new google.maps.places.PlacesService(map);
    service.textSearch({query: address}, function(results, status) {
      var location = results[0].geometry.location;
      map.setCenter(location);
      map.setZoom(17);
      app.marker.model.new(map, location);
    });
  })
}