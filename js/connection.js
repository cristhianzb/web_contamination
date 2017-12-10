var connection = "pg://tbd:relational22@localhost:5432/web";
var client= new pg.Client(connection);



//var query=client.query("insert into estacion(lugar,latitud,longitud,fecha_ini) values('cocha',15,-17,'2017-11-13')");
//client.end();

//insertEstacion("cristo de la concordia",-17.384407,-66.1350088,2500,"2017-12-09");

function prueba(){
  console.log("Funciona");
}

function insertEstacion(direccion,latitud,longitud,altitud,fecha_ini){
  client.connect();
  consulta = "select newestacion('"+direccion+"',"+latitud+","+longitud+","+altitud+",'"+fecha_ini+"',true);";
  client.query(consulta)
    .then(data=> {
        client.end();
    })
    .catch(error=> {
        console.log(error);
        client.end();
    });
}

function getContaminantes(){
    client.connect();
    consulta = "select nombre from contaminante;";
    client.query(consulta,function(error, result){
        if(error){
          console.log(error);
          client.end();
        }else{
          var lista=[];
          result.rows.forEach(
            function (valor){
                lista.push(valor.nombre);
            }
          );
          client.end();
          return lista;
        }
    });
}
