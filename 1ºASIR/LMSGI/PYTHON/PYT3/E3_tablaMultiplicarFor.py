num = int(input("Introduzca un numero: "))

if num > 0:
    print("Tabla de Multiplicar del", num, ":")
    for i in range(0,11):
        print(num,"x",i,"=",num*i)

else:
    print("El numero introducido no puede ser negativo")