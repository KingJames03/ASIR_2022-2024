<?php
$nomsCognoms ["nom0"]="cognom0";
$nomsCognoms ["nom1"]="cognom1";
$nomsCognoms ["nom2"]="cognom2";
$nomsCognoms ["nom3"]="cognom3";
$nomsCognoms ["nom4"]="cognom4";


echo "<b>Vector asociativo con FOREACH</b>";
echo "<br>";
foreach ($nomsCognoms as $nom => $cognom) {
    
    echo $nom . " >>>>>" . $cognom ;
    echo "<br>";
}
?>
