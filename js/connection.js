var pg = require('pg');
var connection = "pg://bd:ps@localhost:5432/pru";
var client= new pg.Client(connection);
client.connect();

var query=client.query("insert into estacion(lugar,latitud,longitud,fecha_ini) values('cocha',15,-17,'2017-11-13')");
//client.end();
