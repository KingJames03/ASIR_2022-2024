<?php




$inicio = 1;
$fin = 100;
$incremento = 1;
$suma = 0;

        
            for ($inicio; $inicio <= $fin; $inicio+=$incremento) {
                
                echo $inicio;
                if ($inicio % 10 == 0){
                    
                    echo "<br>";
                }
                else{
                    
                    echo '-';
                }
                
             
                $suma=$suma + $inicio;
        }
        $inicio=1;
        echo "<br>";
        echo "La suma es de los números entre " . $inicio . " y " . $fin . " es:"  . "<b>" .$suma;
?>
