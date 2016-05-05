app.marker.model = {
  all: [],

  new: (function(map, location) {
    new google.maps.Marker({
      map: map,
      position: location
    });
  })
} // ends marker model