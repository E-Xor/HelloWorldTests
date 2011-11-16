

var map;
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

function initialize() {
    map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);

function reLocate(from_to) {
  geocoder = new google.maps.Geocoder();
    address = document.getElementById(from_to+'_address').value;
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

function showDirections() {
  geocoder = new google.maps.Geocoder();
    var address_from = document.getElementById("from_address").value;
    var address_to = document.getElementById("to_address").value;
    if (address_from != '' && address_to != '') {
      geocoder.geocode( { 'address': address_from}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          location_from = results[0].geometry.location;
        } else { alert("Geocode was not successful for the following reason: " + status); }
      });
      geocoder.geocode( { 'address': address_to}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          location_to = results[0].geometry.location;
        } else { alert("Geocode was not successful for the following reason: " + status); }
       });
    }

  var request = {
    origin: location_from,
    destination: location_to,
    travelMode: google.maps.DirectionsTravelMode.DRIVING
  };
  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsDisplay.setMap(map);

  directionsService = new google.maps.DirectionsService();
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      distance = "The distance between the two points on the chosen route is: "+response.routes[0].legs[0].distance.text;
      distance += ".The aproximative driving time is: "+response.routes[0].legs[0].duration.text;
      document.getElementById("road").innerHTML = distance;
    } else { alert("Direction Service was not successful for the following reason: " + status); }
  });
}

function reLocateViaEnter(from_to) {
  evt = event;
  var charCode = (evt.charCode) ? evt.charCode : ((evt.which) ? evt.which : evt.keyCode);
  if (charCode == 13) {
    reLocate(from_to);
  }
  return true;
}

