<?php
$nomsCognoms = array(
    "cognom0" => "nom0",
    "cognom1" => "nom1",
    "cognom2" => "nom2",
    "cognom3" => "nom3",
    "cognom4" => "nom4",
);

echo "<b>Vector asociativo con FOREACH</b>";
echo "<br>";
foreach ($nomsCognoms as $cognom => $nom) {
    
    echo $nom . " >>>>>" . $cognom ;
    echo "<br>";
}
?>