app.marker.controller = {
  initMarker: (function(location) {
    var map = app.map.model.currentMap;
    var service = new google.maps.places.PlacesService(map);
    service.textSearch({query: location}, function(results, status) {
      var latLng = results[0].geometry.location;
      map.setCenter(latLng);
      map.setZoom(15);
      app.marker.model.new(map, latLng);
    });
  })
}