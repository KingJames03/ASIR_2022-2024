<html>
<head>
    <title>Números pares hasta 100 en forma de tabla</title>
</head>
<body>

    <p>Pares hasta 100 en TABLA</p>

<table border="2" width="40" cellspacing="4" cellpadding ="2">
    <thead>
        <tr>
            <th>Números pares</th>
        </tr>
    </thead>
    <tbody>
        <?php
      $inicio = 0;
      $fin = 100;
    do
    {
            if ($inicio % 2 == 0) {
                echo "<tr><td>" . $inicio . "</td></tr>";
            }
            $inicio++;
        }while ($inicio <= $fin);

        ?>
    </tbody>
</table>

</body>
</html>
