<?php

$numFrenos=1;
$numAceite=2;
$numRuedas=3;
$totalart=$numFrenos+$numAceite+$numRuedas;

define("preciofrenos", 100);
define("precioaceite", 10);
define("precioruedas", 4);

$total=($numFrenos*preciofrenos)+($numAceite*precioaceite)+($numRuedas*precioruedas);
$IVA=$total*0.21;
$totaliva=$total+$IVA;

echo "Suponiendo que hemos comprado las siguientes unidades:";
echo "<br>";
echo "<br>";
echo "numFrenos= ".$numFrenos;
echo "<br>";
echo "numAceite= ".$numAceite;
echo "<br>";
echo "numRuedas= ".$numRuedas;
echo "<br>";
echo "<br>";
echo "<h2><b>PRECIO DE LOS ARTICULOS</b></h2>";
echo "<br>";
echo "PRECIOFRENOS= ".preciofrenos;
echo "<br>";
echo "PRECIOACEITE= ".precioaceite;
echo "<br>";
echo "PRECIORUEDAS= ".precioruedas;
echo "<br>";

if ($numFrenos > 0 && $numAceite > 0 && $numRuedas > 0) {
     echo "<h2><b>Se han comporado todos los articulos</b></h2>";
     echo "<br>";
     echo "Su petición es la siguiente";
     echo "<br>";
     echo "Frenos: ".$numFrenos;
     echo "<br>";
     echo "Aceite: ".$numAceite;
     echo "<br>";
     echo "Ruedas: ".$numRuedas;
     echo "<br>";
     echo "<br>";
     echo "<b>Número de elementos solicitados: ".$totalart;
     echo "<br>";
     echo "Subtotal: ".$total." euros";
     echo "<br>";
     echo "Total con IVA: ".$totaliva." euros";
    
}
 else {
     echo "<br>";
     echo "<br>";
     echo "No comprados: frenos, ruedas";
     echo "<br>";
     echo "<h2><b>La petición ha de contener todos los tipos de artículo!!</b></h2>";
}

?>
