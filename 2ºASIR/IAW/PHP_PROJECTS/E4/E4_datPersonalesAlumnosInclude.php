<html>
<body>

<table border="2" width="240" cellspacing="4" cellpadding ="2">
    <thead>
        <tr>
            <th colspan="2">Datos Personales Alumno</th>
        </tr>
    </thead>
    
<tbody>
        <?php
              include('E4_datPersonalesAlumnos.php');
              
              
              echo "<tr><td>Nombre 1</td><td>$nom_1</td></tr>";
              echo "<tr><td>Apellidos 1</td><td>$ape_1</td></tr>";
              echo "<tr><td>Edad 1</td><td>$edad_1</td></tr>";
              echo "<tr><td>Tlf Móvil 1</td><td>$tlfMov_1</td></tr>";
              echo "<tr><td colspan=2 align=center>=========</td></tr>";
              echo "<tr><td>Nombre 2</td><td>$nom_2</td></tr>";
              echo "<tr><td>Apellidos 2</td><td>$ape_2</td></tr>";
              echo "<tr><td>Edad 2</td><td>$edad_2</td></tr>";
              echo "<tr><td>Tlf Móvil 2</td><td>$tlfMov_2</td></tr>";
              echo "<tr><td colspan=2 align=center>=========</td></tr>";
        ?>
    </tbody>
</table>

</body>
</html>
