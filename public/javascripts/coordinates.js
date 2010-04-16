var geocoder;

function initialize() {
    geocoder = new GClientGeocoder();
}

// addAddressToMap() is called when the geocoder returns an
// answer.  It adds a marker to the map with an open info window
// showing the nicely formatted version of the address and the country code.
function addAddressToInput(response) {
    //map.clearOverlays();
    if (!response || response.Status.code != 200) {
        alert("Die Adresse konnte nicht gefunden werden");
    } else {
        place = response.Placemark[0];
        var longitude = place.Point.coordinates[0];
        var latitude = place.Point.coordinates[1];
        document.getElementById('longitude').value = longitude;
        document.getElementById('latitude').value = latitude;
        document.getElementById('longitude_hidden').value = longitude;
        document.getElementById('latitude_hidden').value = latitude;
    }
    
}

function showLocation() {
    initialize();
    var address = document.getElementById('coordinates_address').value;
    geocoder.getLocations(address, addAddressToInput);
}