num1 = float(input("Introduce el primer número: "))
num2 = float(input("Introduce el segundo número: "))
num3 = float(input("Introduce el tercer número: "))
A = str("A")
D = str("D")

input_opc = str(input("Elige forma de ordenacion: A (ASCENDENTE), D (DESCENDENTE): "))
min_num = float()
mid_num = float()
max_num = float()

if input_opc == A:
    print("Datos de entrada correctos.")
    print("Ordenacion ASCENDENTE")
    if num1 <= num2 and num1 <= num3:
        min_num = num1
        if num2 <= num3:
            mid_num = num2
            max_num = num3
        else:
            mid_num = num3
            max_num = num2
    elif num2 <= num1 and num2 <= num3:
        min_num = num2
        if num1 <= num3:
            mid_num = num1
            max_num = num3
        else:
            mid_num = num3
            max_num = num1
    else:
        min_num = num3
        if num1 <= num2:
            mid_num = num1
            max_num = num2
        else:
            mid_num = num2
            max_num = num1
    print("Los números ordenados de forma ascendente son: ", min_num,"<",mid_num,"<",max_num)

elif input_opc == D:
    print("Datos de entrada correctos.")
    print("Ordenacion DESCENDENTE")
    if num1 <= num2 and num1 <= num3:
        min_num = num1
        if num2 <= num3:
            mid_num = num2
            max_num = num3
        else:
            mid_num = num3
            max_num = num2
    elif num2 <= num1 and num2 <= num3:
        min_num = num2
        if num1 <= num3:
            mid_num = num1
            max_num = num3
        else:
            mid_num = num3
            max_num = num1
    else:
        min_num = num3
        if num1 <= num2:
            mid_num = num1
            max_num = num2
        else:
            mid_num = num2
            max_num = num1
    print("Los números ordenados de forma ascendente son: ", max_num,">",mid_num,">",min_num)

else:
    print("Opcion INCORRECTA. Solo puede ser A (ASCENDENTE) o D (DESCENDENTE)")