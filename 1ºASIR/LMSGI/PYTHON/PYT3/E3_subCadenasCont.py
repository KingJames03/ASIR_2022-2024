cadena = str("Esta es la cadena de entrada usada en este ejercicio")
print("La cadena actual es la cadena de entrada:",cadena)
inicio = 0
final_cadena = len(cadena)
separador = ' '
contador = 0
resto = cadena

while contador < 10:
       print("La cadena actual es:", resto)
       blanco = resto.find(separador,inicio,final_cadena)
       resto = resto[blanco+1:final_cadena]
       final_cadena = len(resto)
       contador = contador + 1

print("La cadena actual es Cadena Vacia")



