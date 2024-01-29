
cadena = str("Esta es la cadena de entrada usada en este ejercicio")
print("La cadena de entrada usada en este ejercicio es:")
print(cadena)

n = int(input("Introduzca la posicion de la palabra a partir de la que visualizamos"))
print("Vamos a buscar la palabra que ocupa la posicion:",n)

palabras = cadena.split() #Se divide la cadena inicial en palabras y se almacena

contador = 0
while contador < n:
       resto = " ".join(palabras[n:]) #Con el join se vuelve a juntar la cadena y ahora sí podemos buscar a partir de la posicion
       contador += 1

print("La subcadena buscada es: ",resto)

