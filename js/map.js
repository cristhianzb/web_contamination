
var user=false;
function setUser(active){
  user=active;
}
function initMap(){
      // Map options
      var options = {
        zoom:12,
        center:{lat:-17.413977,lng:-66.165321}
      }
      var subir= "<form action="+'"'+"procesar.php"+'"'+" method="+'"'+'"'+"> <div id="+'"'+"div_file"+'"'+"> <p id="+'"'+"texto"+'"'+"> Add file <input type="+'"'+"file"+'"'+" name="+'"'+"file"+'"'+" id="+'"'+"csv"+'"'+"> </div></form>"
      //New map
      var map = new google.maps.Map(document.getElementById('map'),options);

      // Listen for click on map
      google.maps.event.addListener(map, 'click', function(event){
        //Add marker
        if(user)
          addMarker({coords:event.latLng,content: subir});
        
      });
      //Array of markers
      var markers = [
        {
          coords:{lat:-17.413977,lng:-66.165321},
          iconImage:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
          content: ' chart.draw(data, options);'
        },
        {
          coords:{lat:-17.401977,lng:-66.135000},
          content:' chart.draw(data1, options);'
        },
        {
          coords:{lat:-17.401977,lng:-66.165000}
        }
      ];

      // loop through markers
      for(i=0;i<markers.length;i++){
        //Add marker
        addMarker(markers[i]);
      }

      //Add Marker Function
      function addMarker(props){
        var marker = new google.maps.Marker({
          position:props.coords,
          map:map,
          //icon:props.iconImage
        });

        //Check for custom icon
        if(props.iconImage){
          // Set icon image
          marker.setIcon(props.iconImage);
        }

        //Check content
        if(props.content){
          var infoWindow = new google.maps.InfoWindow({
            content:props.content
          });

          marker.addListener('click', function(){
            infoWindow.open(map, marker);
          });
        }
      }
    }