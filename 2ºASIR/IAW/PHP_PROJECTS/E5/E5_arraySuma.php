<?php
$numeros = array(10,20,30,40,50);
$elementos = count($numeros);
$suma=0;

echo "<b>Declarar y Recorrer Vectores</b>";
echo "<br>";
echo "<br>";
echo "Declara array unidimensional";
echo "<br>";
echo "<br>";
echo "Recorre array";
echo "<br>";
echo "<br>";
echo "Número de elementos del array: ". $elementos;
echo "<br>";
echo "<br>";
echo "Los elementos del array son: ";
echo "<br>";

for ($i = 0; $i < $elementos; $i++) {
    
    echo $numeros[$i];
    echo "<br>";
    $suma = $suma + $numeros[$i];
        
    }
echo "<br>";

echo "<b>SUMA=".$suma;
?>
