input_inf = int(input("Introduzca valor inferior"))
input_sup = int(input("Introduzca valor superior"))
print("Los numeros pares que hay entre",input_inf,"y",input_sup)

cont = 0

if input_inf % 2 != 0:
    input_inf += 1

num = input_inf
while num <= input_sup:
    print(num)
    num += 2
    cont += 1

print("Desde",input_inf,"hasta",input_sup,"hay",cont,"pares")
