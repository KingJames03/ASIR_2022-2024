<?php

include 'E5_datPersonales.php';

$datos_alumnos = array($nombre1, $apellidos1, $edad1, $movil1, $nombre2, $apellidos2, $edad2, $movil2);
$elements = count($datos_alumnos);

echo "<b>Array Datos Alumno</b>";
echo "<br>";
echo "<br>";
echo "<h2><b>Los datos del array son:</b></h2>";
for ($i = 0; $i < $elements; $i++) {
    
    echo $datos_alumnos[$i];
    echo "<br>";
        
    }

?>
