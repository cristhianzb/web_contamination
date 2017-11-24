<?php
	class conexion
	{
		
		function recuperarDatos(){
			$host = "localhost";
			$user="root";
			$pw="";
			$db="web2";
		
			$Con = mysql_connect($host,$user,$pw) or die("Nose pudo conectar a la base de datos");
			mysql_select_db($db,$Con) or die ("No se encontro la base de datos");
			$query = "SELECT * FROM medicion";
			$resultado = mysql_query($query);

			while($fila = mysql_fetch_array($resultado)){
				echo "$fila[fecha]<br>";
				echo "$fila[equipo_id]<br>";
				echo "$fila[contaminante_id]<br>";
				echo "$fila[unidad_id]<br>";
			}

		}
	}
?>
//sdfasdfasdfasdfasdfa/as/df/asdf
