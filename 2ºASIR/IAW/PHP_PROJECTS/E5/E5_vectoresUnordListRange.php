<?php

$vect = range(10, 100, 10);

$numelements = count($vect);

    echo "<ul>";

    
    for ($i = 0; $i < $numelements; $i++) {
        echo "<li>Element $i val: {$vect[$i]}</li>";
    }

    echo "</ul>";



?>

