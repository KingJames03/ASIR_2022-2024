<?php
define("PRECIO_JUDIAS", 3.50);
$peso_judias= 1.21;
$coste_judias= PRECIO_JUDIAS * $peso_judias;


define("PRECIO_PATATAS", 0.4);
$peso_patatas= 1.73;
$coste_patatas= PRECIO_PATATAS * $peso_patatas;

define("PRECIO_TOMATES", 1);
$peso_tomates= 2.08;
$coste_tomates= PRECIO_TOMATES * $peso_tomates;

define("PRECIO_MANZANAS", 1.2);
$peso_manzanas= 2.15;
$coste_manzanas= PRECIO_MANZANAS * $peso_manzanas;


define("PRECIO_UVAS", 2.5);
$peso_uvas= 0.77;
$coste_uvas= PRECIO_UVAS * $peso_uvas;


$total=$coste_judias+$coste_patatas+$coste_tomates+$coste_manzanas+$coste_uvas;

echo "<h1><b>PRODUCTO - PRECIO Euros/KG - PESO - PRECIO concepto</b></h1>";
echo "<br>";
echo "<br>";
echo "JUDIAS ---------".PRECIO_JUDIAS."---------".$peso_judias."---------".number_format($coste_judias, 2);
echo "<br>";
echo "PATATAS ---------".PRECIO_PATATAS."---------".$peso_patatas."---------".number_format($coste_patatas, 2);
echo "<br>";
echo "TOMATES ---------".PRECIO_TOMATES."---------".$peso_tomates."---------".number_format($coste_tomates, 2);
echo "<br>";
echo "MANZANAS ---------".PRECIO_MANZANAS."---------".$peso_manzanas."---------".number_format($coste_manzanas, 2);
echo "<br>";
echo "UVAS ---------".PRECIO_UVAS."---------".$peso_uvas."---------".number_format($coste_uvas, 2);
echo "<br>";
echo "<br>";
echo "TOTAL: ".number_format($total, 2)." euros";
echo "<br>";
echo "Gracias por su compra."


?>
