<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<title>Carrito de Compras</title>
	<link rel="stylesheet" type="text/css" href="../css/estilosprincipal.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<script type="text/javascript"  href="./js/scripts.js"></script>
</head>
<body>
	
		<h1>Carrito De Compras</h1>
		 <div class="topnav">
			  <a class="active" href="#home">Inicio</a>
			  <a href="#contact">Contactenos</a>
			  <a href="./carritodecompras.php"  title="ver carrito de compras"><img src="../imagenes/carrito1.png"></a>
			  <a href="./login.html"><i class="fas fa-sign-in-alt" style="color:lightblue"></i></a>
			</div> 
	<section>
		

		<?php
		include '../../modelo/conexion.php';
		$re=$con->query("call C_Producto")or die(mysqli_error());
		while ($f=mysqli_fetch_array($re)) {
		?>


			<div class="producto">
			<center>
				<img src="../productos/<?php echo $f['imagen'];?>"><br>
				<span><?php echo $f['Nombre'];?></span><br>
				<a href="./detalles.php">ver</a>
			</center>
		</div>
	<?php
		}
	?>

	</section>
</body>
</html>