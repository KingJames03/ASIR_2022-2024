<html>
<head>
    <title>Datos personales</title>
</head>
<body>
    
<?php
$nombre = "Jaime";
$ape1 = "Mayordomo";
$ape2 = "Garcia";
$calle = "C/ Marines, 26";
$cp = 46191;
$tel = 654123879;
$prof = "Técnico superior en ASIR";
?>

<p>Nombre: <?php echo $nombre; ?></p>
<p>Apellidos: <?php echo $ape1 . " " . $ape2; ?></p>
<p>Domicilio: <?php echo $calle; ?></p>
<p>Código Postal: <?php echo $cp; ?></p>
<p>Teléfono: <?php echo $tel; ?></p>
<p>Profesión: <?php echo $prof; ?></p>

</body>
</html>

