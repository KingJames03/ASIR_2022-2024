<html>
<body>

<table border="2" width="40" cellspacing="4" cellpadding ="2">
    <thead>
        <tr>
            <th colspan="2">Datos Personales</th>
        </tr>
    </thead>
    
<tbody>
        <?php
              include('E4_datPersonales.php');
              
              
              echo "<tr><td>Nombre</td><td>$nombre</td></tr>";
              echo "<tr><td>Apellidos</td><td>$apellidos</td></tr>";
              echo "<tr><td>Edad</td><td>$edad</td></tr>";
              echo "<tr><td>Tlf Móvil</td><td>$tlf</td></tr>";
        ?>
    </tbody>
</table>

</body>
</html>