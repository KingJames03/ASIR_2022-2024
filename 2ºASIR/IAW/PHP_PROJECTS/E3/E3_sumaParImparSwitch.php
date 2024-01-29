<?php
$inicio = 0;
$fin = 100;
$incremento = 1;
$sumapares = 0;
$sumaimpares = 0;

while ($inicio <= $fin){
    
    switch ($inicio)
    {
        case ($inicio % 2 == 0):
            $sumapares = $sumapares+$inicio;
            break;
            
        case ($inicio % 2 == 1):
            $sumaimpares = $sumaimpares+$inicio;
            break;
            
        default:
            break;
       
    }
    $inicio++;
}      
       $inicio=0;
       echo "En el rango ". $inicio . " .... " . $fin . ":";
       echo "<br>";
       echo "La suma de los <b>PARES</b> es:" . $sumapares;
       echo "<br>";
       echo "La suma de los <b>IMPARES</b> es:" . $sumaimpares;

?>
