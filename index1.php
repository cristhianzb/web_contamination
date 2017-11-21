<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Recuperando datos de mysql PHP</title>
	<link rel="stylesheet" href="conexion.php">
<body>
		<div>
			<fieldset>
				<legend> Datos recuperados</legend>
				<div>			
					<?php 

							include("conexion.php");
							$Con = new conexion();
							$Con->recuperarDatos();
					 ?>		
				</div>
			</fieldset>

		</div>
	</body>
	<footer>
		
	</footer>	

</html>
