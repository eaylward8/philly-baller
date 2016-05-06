app.marker.model = {
  all: [],

  new: (function(map, latLng) {
    new google.maps.Marker({
      map: map,
      position: latLng
    });
  })
} // ends marker model8