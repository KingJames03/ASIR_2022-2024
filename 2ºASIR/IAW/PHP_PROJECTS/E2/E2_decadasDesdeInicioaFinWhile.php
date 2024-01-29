
<html>
<head>

</head>
<body>


<table border="2" width="40" cellspacing="4" cellpadding ="2">
    <thead>
        <tr>
            <th>Décadas desde el 2000 al 2100</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $inicio = 2000;
        $fin=2100;
        while ($inicio <= $fin) {
                echo "<tr><td>" . $inicio . "</td></tr>";
  
            $inicio+=10 ;
        }
        ?>
    </tbody>
</table>

</body>
</html>
