
<html>
<body>
<table border="2" width="120" cellspacing="4" cellpadding ="2">
<tbody>
    
<?php
$personas = array(
    "Luís" => "López",
    "Ana" => "García",
    "Daniel" => "Pérez",
    "Héctor" => "Sánchez",
    "Adrián" => "Sala",
);

$size = sizeof($personas);
echo "<tr><td><b>Nombre</b></td><td><b>Apellidos</b></td><tr>";

for ($i = 1; $i <= $size; $i++){
    echo "<tr><td>".key($personas)."</td><td>".current($personas)."</td></tr>";
    echo "<br>";
    next($personas);
}
?>
</tbody>
</table>
</body>
</html>