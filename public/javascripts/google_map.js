var map;
var geocoder = new google.maps.Geocoder();
var myOptions = {
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
	reLocate();
	var input_from = document.getElementById('from_address');
	var input_to = document.getElementById('to_address');
	autocomplete_from = new google.maps.places.Autocomplete(input_from);
	autocomplete_to = new google.maps.places.Autocomplete(input_to);	
}

google.maps.event.addDomListener(window, 'load', initialize);

function reLocate() {
	map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
	address = document.getElementById('from_address').value;
	if(address != '') {
		if (geocoder) {
			geocoder.geocode( { 'address': address}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					map.setCenter(results[0].geometry.location);
					map.setZoom(10);
				} else { alert("Geocode was not successful for the following reason: " + status); }
			});
		}
	}
	else {
		map.setCenter(new google.maps.LatLng(-34.397, 150.644));
		map.setZoom(4);
	}
}

function showDirections() {
	reLocate();
	geocoder = new google.maps.Geocoder();
	address_from = document.getElementById("from_address").value;
	address_to = document.getElementById("to_address").value;
	if (address_from != '' && address_to != '') {
	  geocoder.geocode( { 'address': address_from}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			location_from = results[0].geometry.location;
			var marker_from= new google.maps.Marker({
				map: map,
				position: location_from,
				title: "From Marker"
			});
		  google.maps.event.addListener(marker_from, 'click', function() {
			new google.maps.InfoWindow({
				content: '<p>From: ' + address_from + '</p><p>Coordinates: ' + location_from + '</p>'
			}).open(map,marker_from);
		  });
		} else { alert("Geocode was not successful for the following reason: " + status); }
	  });
	  geocoder.geocode( { 'address': address_to}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
		  location_to = results[0].geometry.location;
		  var marker_to= new google.maps.Marker({
			map: map,
			position: location_to,
			title: "To Marker"
		  });
		  google.maps.event.addListener(marker_to, 'click', function() {
			new google.maps.InfoWindow({
				content:  '<p>To: ' + address_to + '</p><p>Coordinates: ' + location_to + '</p>'
			}).open(map,marker_to);
		  });
		} else { alert("Geocode was not successful for the following reason: " + status); }
	   });
	}

	directionsDisplay = new google.maps.DirectionsRenderer({
		suppressMarkers: true,
		suppressInfoWindows: true
	});
	directionsDisplay.setMap(map);

	var directionsService = new google.maps.DirectionsService();
	directionsService.route({
		origin: address_from,
		destination: address_to,
		travelMode: google.maps.DirectionsTravelMode.DRIVING
	},
	function(response, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(response);
			distance = "The distance between the two points on the chosen route is: "+response.routes[0].legs[0].distance.text;
			distance += ".The aproximative driving time is: "+response.routes[0].legs[0].duration.text;
			document.getElementById("road").innerHTML = distance;
		} else { alert("Direction Service was not successful for the following reason: " + status); }
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

function showDirectionsViaEnter() {
	evt = event;
	var charCode = (evt.charCode) ? evt.charCode : ((evt.which) ? evt.which : evt.keyCode);
	if (charCode == 13) {
		showDirections();
	}
	return true;
}
