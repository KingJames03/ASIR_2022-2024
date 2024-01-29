<html>
<head>

</head>
<body>


<table border="2" width="40" cellspacing="4" cellpadding ="2">
    <thead>
        <tr>
            <th>Lista de valores con un incremento usando bucle while</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $inicio = 0;
        $fin = 100;
        $incremento = 5;
        
        while ($inicio <= $fin) {
                echo "<tr><td>" . $inicio . "</td></tr>";
            $inicio+=$incremento;
        }
        ?>
    </tbody>
</table>

</body>
</html>