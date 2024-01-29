<?php

include("E4_compraArticulosHeader.php");


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

include("E4_compraArticulosFooter.php");
?>

