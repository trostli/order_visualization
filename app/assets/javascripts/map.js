sprig = {}

var markersArray = []
var counter = 0
sprig.infoWindow = new google.maps.InfoWindow;

sprig.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(37.7616357, -122.4408616),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  sprig.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}

sprig.getMarkers = function(e) {
    e.preventDefault();
    $.ajax({
      url:"/orders",
      type: "GET",
      dataType: "json",
      data: $('#time_form').serialize()
    }).done(sprig.saveMarkers)

    $.ajax({
      url:"/hubs",
      type: "GET",
      dataType: "json",
      data: $('#time_form').serialize()
    }).done(sprig.saveMarkers)
}

sprig.saveMarkers = function(markerData) {
  // sprig.clearMarkers();
  sprig.markerData = markerData;
  sprig.MakeMarkers(markerData);
}

sprig.MakeMarkers = function(markerData) {
  var self = this
  $.each(markerData, function(index, element) {
    if (element.hub_id) {
      var contentInfo =
      '<p>' + '<strong>Assigned to hub #: </strong>' + String(element.hub_id) + '</p>'
      +  '<p>' + '<strong># of items: </strong>'  + String(element.num_items) + '</p>'
      + '<p>' + '<strong>Created at: </strong>'  + String(element.created_at) + '</p>'
      + '<p>' + '<strong>Started at: </strong>'  + String(element.started_at) + '</p>'
      + '<p>' + '<strong>Completed at: </strong>'  + String(element.completed_at) + '</p>';
    } else {
      var contentInfo = '<p>' + '<strong>Hub: </strong>' + String(element.id) + '</p>'
    }

    var marker = self.makeMarker(index, element)

    google.maps.event.addListener(marker, 'mouseover', function() {
      sprig.infoWindow.setOptions({disableAutoPan : true })
      sprig.infoWindow.open(sprig.map, marker)
      var content =  contentInfo;
      sprig.infoWindow.setContent(content);
    });
    var temp = document.getElementById("map-canvas");
    google.maps.event.addListener(sprig.map, 'click', function() {
      sprig.infoWindow.close();
    });
  });
}

sprig.makeMarker = function (index, markerData) {
  global = markerData
  var myLatlng = new google.maps.LatLng(markerData.latitude, markerData.longitude)
  var num = index
  var marker = new google.maps.Marker({
    position: myLatlng,
    title: 'Click to Zoom',
    icon: markerData.hub_id ? sprig.getOrderIcon(markerData.hub_id) : sprig.getHubIcon(markerData.id)
  });
  marker.setMap(this.map);
  markersArray.push(marker);

  return marker
}

sprig.getOrderIcon = function (hub_id) {
  switch(hub_id) {
    case 1:
        iconPath = "/assets/icons/blue_order.png"
        break;
    case 2:
        iconPath = "/assets/icons/green_order.png"
        break;
    case 3:
        iconPath = "/assets/icons/orange_order.png"
        break;
    case 4:
        iconPath = "/assets/icons/pink_order.png"
        break;
    case 5:
        iconPath = "/assets/icons/purple_order.png"
        break;
    case 6:
        iconPath = "/assets/icons/red_order.png"
        break;
    case 7:
        iconPath = "/assets/icons/turquoise_order.png"
        break;
    case 8:
        iconPath = "/assets/icons/violet_order.png"
        break;
    case 9:
        iconPath = "/assets/icons/yellow_order.png"
        break;
    default:
        iconPath = "https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=|FF0000|000000"
  }
  return iconPath
}

sprig.getHubIcon = function (id) {
  switch(id) {
    case 1:
        iconPath = "/assets/icons/blue_hub.png"
        break;
    case 2:
        iconPath = "/assets/icons/green_hub.png"
        break;
    case 3:
        iconPath = "/assets/icons/orange_hub.png"
        break;
    case 4:
        iconPath = "/assets/icons/pink_hub.png"
        break;
    case 5:
        iconPath = "/assets/icons/purple_hub.png"
        break;
    case 6:
        iconPath = "/assets/icons/red_hub.png"
        break;
    case 7:
        iconPath = "/assets/icons/turquoise_hub.png"
        break;
    case 8:
        iconPath = "/assets/icons/violet_hub.png"
        break;
    case 9:
        iconPath = "/assets/icons/yellow_hub.png"
        break;
    default:
        iconPath = "https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=|FF0000|000000"
  }
  return iconPath
}

sprig.clearMarkers = function() {
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
}



function initializeMap() {
    sprig.clearMarkers();
    sprig.makeMap();
    $('#time_form').on('submit', sprig.getMarkers);
    $('#date_form').on('submit', sprig.getMarkers);
}

$(document).ready(function(){
  google.maps.event.addDomListener(window, "load", initializeMap);
})







