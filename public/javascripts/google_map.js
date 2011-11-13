geocoder = new google.maps.Geocoder();

  var map;
  function initialize() {
    var myOptions = {
      zoom: 4,
      center: new google.maps.LatLng(-34.397, 150.644),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      // Add some controls
      panControl: true,
      zoomControl: true,
      mapTypeControl: true,
      scaleControl: true,
      streetViewControl: true,
      overviewMapControl: true
    };
    map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);

  }
  google.maps.event.addDomListener(window, 'load', initialize);

  function reLocate() {
    address = document.getElementById("map_address").value;
    if (address != '') {
      if (geocoder) {
        geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            location1 = results[0].geometry.location;
            map.setCenter(location1);
            map.setZoom(10);
      } else { alert("Geocode was not successful for the following reason: " + status); }
         });
       }
    }
  }
