<?php

$vect=array("Juan","Pepe","Ramón","Andrés","Joan");
$cadena = reset($vect);

echo "Contenido del vector de cadenas con WHILE-RESET-NEXT:<br>";

while ($cadena){
    echo $cadena;
    $cadena = next($vect);
    echo "<br>";
}

?>
