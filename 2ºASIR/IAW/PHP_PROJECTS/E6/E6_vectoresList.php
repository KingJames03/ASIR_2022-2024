<?php
$personas = array(
    "Luís" => "López",
    "Ana" => "García",
    "Daniel" => "Pérez",
    "Héctor" => "Sánchez",
    "Adrián" => "Sala",
);
$size = sizeof($personas);
    echo "<b>Vectors Asociativos</b>";
    echo "<br>";
    echo "Recorre vector con while-list(clave-valor):";
    echo "<br>";
    
for ($i = 1; $i <= $size; $i++){
    echo $i . "-" . key($personas) . " ". current($personas);
    echo "<br>";
    next($personas);
}
?>
