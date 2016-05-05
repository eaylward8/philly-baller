app.map.model = {
  currentMap: null,

  new: (function(lat, lng, zoom) {
    app.map.model.currentMap = new google.maps.Map(document.getElementById('map'), {
      center: {lat: lat, lng: lng},
      zoom: zoom
    });
  })
}