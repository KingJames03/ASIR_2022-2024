<?php

define('radio', 6371);
define('distancia_al_sol', 150000000);
define('pi', 3.14);
$long=2*pi*radio;
$vueltas=distancia_al_sol/$long;

echo "El radio de la tierra es:"." "."<b>". radio ." "."Km"."</b>";
echo '<br>';
echo "La distancia de la tierra al sol es:"." "."<b>".distancia_al_sol." "."Km"."</b>";
echo '<br>';
echo "La longitud de una vuelta al Ecuador es:"." "."<b>".$long." "."Km"."</b>";
echo '<br>';
echo "La longitud equivale a:"." "."<b>".$vueltas." "."vueltas  "."</b>";
?>
