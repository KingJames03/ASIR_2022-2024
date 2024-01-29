x = int(input("Introduzca primer valor:"))
y = int(input("Introduzca segundo valor:"))

if (x > y):
    print("Los numeros son DIFERENTES. Veamos quien es el mayor")
    print("El maximo es el primero")
    print("Maximo",x)
elif (x < y):
    print("Los numeros son DIFERENTES. Veamos quien es el mayor")
    print("El maximo es el segundo")
    print("Maximo",y)
else:
    print("Los numeros son IGUALES: Maximo = Minimo=",x)