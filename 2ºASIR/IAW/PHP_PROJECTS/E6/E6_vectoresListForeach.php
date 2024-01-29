<?php
$personas = array(
    "Luís" => "López",
    "Ana" => "García",
    "Daniel" => "Pérez",
    "Héctor" => "Sánchez",
    "Adrián" => "Sala",
);

    echo "<b>Vectors Asociativos-Foreach</b>";
    echo "<br>";
    echo "Visualizamos el vector creado:";
    echo "<br>";
    
    echo "<ul>";
    foreach ($personas as $nom => $cognom) {
    
        echo "<li>";
    echo $nom . " =>" ." " .$cognom ;
    echo "</li>";
    echo "<br>";
}

echo "</ul>";
?>

