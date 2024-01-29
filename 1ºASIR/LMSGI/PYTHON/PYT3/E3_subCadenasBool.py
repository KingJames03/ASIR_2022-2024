cadena = str("Esta es la cadena de entrada usada en este ejercicio")
print("La cadena actual es la cadena de entrada:",cadena)
inicio = 0
final_cadena = len(cadena)
separador = ' '
contador = 0
resto = cadena
blanco = 0
Condicion = (blanco >= 0)

while Condicion == True:
       print("La cadena actual es:", resto)
       blanco = resto.find(separador,inicio,final_cadena)
       print("La posicion del caracter buscado es:",blanco)
       resto = resto[blanco + 1:final_cadena]
       final_cadena = len(resto)
       Condicion = (blanco >= 0)

print("La cadena actual es Cadena Vacia")



