<?php

$vect=array(10,20,30,40);
$vectorAbreviado = [10, 20, 30, 40];

$num_elements=count($vect);

echo "<ul>";
    

    for ($i = 0; $i < $num_elements; $i++) {
        echo "<li>Element $i val: {$vect[$i]}</li>";
    }

    echo "</ul>";
?>

