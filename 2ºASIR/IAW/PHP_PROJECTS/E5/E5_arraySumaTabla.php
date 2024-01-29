



<html>
<body>
    
<table border="2" width="120" cellspacing="4" cellpadding ="2">

    
<tbody>
        <?php
  
        $numeros = array(100,200,300,400,500);
        $elementos = count($numeros);
        $suma=0;
            
              echo "<b>Visualiza array como tabla</b>";
              echo "<tr><th>Posición</th><th>Valor</th></tr>";
              for ($i = 0; $i < $elementos; $i++) {
                echo "<tr><td>$i</td><td>$numeros[$i]</td></tr>";
                echo "<br>";
                $suma = $suma + $numeros[$i];
        
            }
              echo "<br>";
              echo "<tr><td><b>SUMA</b></td><td><b>$suma</b></td></tr>";
              
              
        ?>
    </tbody>
</table>

</body>
</html>


