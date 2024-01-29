input_num = int(input("Introduzca un numero:"))

cond = (input_num >= 0)
i =int(0)
while cond == False: #Bucle que asegura la condicion de que el numero sea positivo
    print("El numero introducido no puede ser negativo")
    input_num = int(input("Introduzca otro numero"))
    cond = (input_num >= 0)

while i in range (0,11):
    print(input_num,"*",i,"=",input_num*i)
    i += 1




