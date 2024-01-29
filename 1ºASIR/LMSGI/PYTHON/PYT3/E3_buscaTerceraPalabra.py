
cadena = str("Esta es la cadena de entrada usada en este ejercicio")
print("La cadena de entrada usada en este ejercicio es:")
print(cadena)

print("Posicion primer blanco:",cadena.find(" ",1,len(cadena)))

print("Primera palabra es:",cadena[:4])
rest = cadena[4:]

print("Resto de cadena",rest)

new_rest = rest.strip()

print("Posicion segundo blanco:",new_rest.find(" ",1,len(new_rest)))
print("Segunda palabra es:",new_rest[:2])

new_rest2 = new_rest[2:]
print("Resto de cadena:",new_rest2)




