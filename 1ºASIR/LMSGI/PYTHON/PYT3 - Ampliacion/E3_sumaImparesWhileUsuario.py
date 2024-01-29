input_inf = int(input("Introduzca valor inferior"))
input_sup = int(input("Introduzca valor superior"))
print("Impares entre",input_inf,"y",input_sup,":")


cont = 0
suma_impares = 0
num = input_inf

while num <= input_sup:
    if num % 2 != 0:
        print(num)
        suma_impares += num
        cont += 1
    num += 1

print("Desde", input_inf, "hasta", input_sup, "hay:", cont, "impares")
print("Suma:",suma_impares)
