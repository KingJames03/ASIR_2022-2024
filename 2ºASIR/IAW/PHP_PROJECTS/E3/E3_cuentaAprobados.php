<?php


$aprobados = 0;
$contador = 0;

while ($contador <= 4 ) {
    $nota = rand(0,10);
    
    if ($nota >= 5){
        $aprobados += 1;
    }
    echo $nota;
    echo "<br>";
    $contador++;
}
echo "<br>";
echo "<b>El número de alumnos aprobados es: " . $aprobados;



?>