
<html>
<body>
<table border="2" width="200" cellspacing="4" cellpadding ="2">
<tbody>
    
<?php

include 'E5_datPersonales.php';

$datos_alumnos = array($nombre1, $apellidos1, $edad1, $movil1, $nombre2, $apellidos2, $edad2, $movil2);
$count_alumnos = count($datos_alumnos);

$cabecera= array("Nombre", "Apellido", "Edad", "Teléfono");
$count_datos = count($cabecera);

echo "<tr><td colspan=2 align=center><b>Datos personales</b></td><tr>";
for ($i = 0; $i < $count_alumnos; $i++) {
            $cab=$i%4;
            echo "<tr><td>{$cabecera[$cab]}</td>";
            echo "<td>$datos_alumnos[$i]</td>";
        }
?>
</tbody>
</table>
</body>
</html>