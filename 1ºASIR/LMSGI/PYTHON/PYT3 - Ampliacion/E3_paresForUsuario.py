input_inf = int(input("Introduzca valor inferior"))
input_sup = int(input("Introduzca valor superior"))
cont = 0

condicion = (input_inf < input_sup)
while condicion == False:
    print("NO estan ORDENADOS los exremos:",input_inf, "NO es <", input_sup)
    print("Vuelva a intentar")
    input_inf = int(input("Introduzca valor inferior"))
    input_sup = int(input("Introduzca valor superior"))
    condicion = (input_inf < input_sup)

print("Cumple que inicio<fin:", input_inf, "<", input_sup)
for num in range(input_inf, input_sup):
    if num % 2 == 0:
        print(num)
        cont = cont + 1
print("Desde", input_inf, "hasta", input_sup, "hay:", cont, "PARES")
