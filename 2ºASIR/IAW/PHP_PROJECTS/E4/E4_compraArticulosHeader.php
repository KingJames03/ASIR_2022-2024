<html>
    
    <body>
        <h1><b>Archivo Header</b></h1>
    </body>
    
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

echo "<h2><b>PRECIO DE LOS ARTICULOS</b></h2>";
echo "<br>";
echo "PRECIOFRENOS= ".preciofrenos;
echo "<br>";
echo "PRECIOACEITE= ".precioaceite;
echo "<br>";
echo "PRECIORUEDAS= ".precioruedas;
echo "<br>";
echo "<br>";
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

?>