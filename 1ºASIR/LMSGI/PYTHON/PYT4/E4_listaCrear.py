print("Rango de palabras: [ 1 , 15 ]")
lista =[]
num = int(input("Cuantas palabras tiene la lista:"))

i = int(0)
if num > 15:
    print("Rango de palabras: [ 1 , 15 ]")
    print("Error. Mayor que maximo")

elif num == 0:
    print("Rango de palabras: [ 1 , 15 ]")
    print("Error. Menor que mínimo")

else:
    print("Rango de palabras: [ 1 , 15 ]")
    while i < num:
        word = input("Introduce la palabra:")
        lista.append(word)
        i += 1

    print("La lista creada es:",lista)