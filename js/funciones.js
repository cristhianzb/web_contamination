
//crea un objeto mapa y especifica el elemento DOM para mostrarlo
function initMap(){
  var map_prop = {
    center: {lat:-17.3934241,lng: -66.1468367},
    zoom:8,
  };
  var map = new google.maps.Map(document.getElementById('map'),map_prop);
  var site = {lat:-17.3934241,lng:-66.1468367};
  //crear una marca
  var marker = new google.maps.Marker({
    position:site,
    map: map,
    title:'aqui estoy!'  
  });

}
