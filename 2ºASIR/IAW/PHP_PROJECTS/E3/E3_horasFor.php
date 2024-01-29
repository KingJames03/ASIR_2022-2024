<?php

$horain = 0;
$horafin = 23;
$incrementohora = 1;
$minfin = 55;
$incrementomin = 5;

for ($horain; $horain <= $horafin; $horain++){
    
    if($horain == 1 ){
        
        echo "Fracciones de la " .$horain. ":<br>";
        
    }else{
        
        echo "Fracciones de las " .$horain. ":<br>";
    }
    
    for ($min=0; $min <= $minfin; $min += $incrementomin){
        
        $hora_format = sprintf("%02d", $horain);
        $minu_format = sprintf("%02d", $min);
        echo "$hora_format:$minu_format<br>";
    }
    echo "<br>";
}

?>
