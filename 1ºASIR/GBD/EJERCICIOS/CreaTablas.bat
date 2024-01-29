@ECHO OFF
if exist tabla_1.sql (
	del tabla_1.sql)
set /p base="Introduce el nombre de la base de datos: "
echo DROP DATABASE IF EXISTS %base%; >> tabla_1.sql
echo CREATE DATABASE %base%; >> tabla_1.sql
echo USE %base%; >> tabla_1.sql
:dos
set /p tabla= "Nombre de la tabla: "
echo CREATE TABLE %tabla% ( >> tabla_1.sql
:uno
set /p variable= "Variable: "
set /p tipo_variable= "Tipo de la variable: "
echo  %variable%	%tipo_variable% >> tabla_1.sql
set /p fin= "Deseas continuar Y/N?: "
if "%fin%"=="N" (goto acabar)	
goto uno
:acabar
echo ); >> tabla_1.sql
set /p new_tabla= "Deseas crear una nueva tabla Y/N?: "
if "%new_tabla%"=="N" (goto fin)
goto dos
:fin