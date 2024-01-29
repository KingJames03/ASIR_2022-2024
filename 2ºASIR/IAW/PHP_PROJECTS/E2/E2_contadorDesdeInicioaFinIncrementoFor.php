<html>
<head>

</head>
<body>


<table border="2" width="40" cellspacing="4" cellpadding ="2">
    <thead>
        <tr>
            <th>Lista de valores con un incremento usando bucle for</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $inicio = 0;
        $fin = 50;
        $incremento = 3;
        
            for ($inicio; $inicio <= $fin; $inicio+=$incremento) {
                echo "<tr><td>" . $inicio . "</td></tr>";
        }
        ?>
    </tbody>
</table>

</body>
</html>

