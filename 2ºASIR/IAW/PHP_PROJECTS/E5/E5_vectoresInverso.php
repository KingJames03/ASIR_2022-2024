<?php

$vect=array("Juan","Pepe","Ramón","Andrés","Joan");
$cadena = end($vect);

echo "Contenido del vector de cadenas con WHILE-END-PREV:<br>";

while ($cadena){
    echo $cadena;
    $cadena = prev($vect);
    echo "<br>";
}

?>
