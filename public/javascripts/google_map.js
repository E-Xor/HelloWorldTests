geocoder = new google.maps.Geocoder();

  var map;
  function initialize() {
    var myOptions = {
      zoom: 4,
      center: new google.maps.LatLng(-34.397, 150.644),
      mapTypeId: google.maps.MapTypeId.HYBRID,
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
    address = document.getElementById("from_address").value;
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

function showDirectionsViaEnter() {
  evt = event;
  var charCode = (evt.charCode) ? evt.charCode : ((evt.which) ? evt.which : evt.keyCode);
  if (charCode == 13) {
    showDirections();
  }
  return true;
}

function showDirections () {
  var location_to = new google.maps.LatLng(-34.397, 150.644);
  var location = new google.maps.LatLng(-33.397, 151.644);
  alert('Locations: ' + location + location_to);

  directionsDisplay = new google.maps.DirectionsRenderer(
//{
//   suppressMarkers: true,
//      suppressInfoWindows: true
//      }
  );
  directionsDisplay.setMap(map);


  var request = {
    origin:location,
    destination:location_to,
    travelMode: google.maps.DirectionsTravelMode.DRIVING
  };

  directionsService = new google.maps.DirectionsService();
  directionsService.route(request, function(response, status)
  { alert('directionsService.route');
    if (status == google.maps.DirectionsStatus.OK)
    { alert('Status OK');
      directionsDisplay.setDirections(response);
      distance = "The distance between the two points on the chosen route is: "+response.routes[0].legs[0].distance.text;
      distance += "The aproximative driving time is: "+response.routes[0].legs[0].duration.text;
      //document.getElementById("distance_road").innerHTML = distance;
      alert ('Distance: ' + distance);
    }
  });
}

function reLocateViaEnter() {
  evt = event;
  var charCode = (evt.charCode) ? evt.charCode : ((evt.which) ? evt.which : evt.keyCode);
  if (charCode == 13) {
    reLocate();
  }
  return true;
}
