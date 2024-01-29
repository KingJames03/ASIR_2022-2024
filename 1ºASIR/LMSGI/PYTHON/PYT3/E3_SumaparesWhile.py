input_inf = int(0)
input_sup = int(15)
print("Los numeros pares que hay entre 0 y 15 son")



num = input_inf
cont = 0
suma_pares = 0

while num <= input_sup:
    print(num)
    suma_pares = num + suma_pares
    num = num + 2
    cont = cont + 1

print("Desde 0 hasta 15 hay",cont,"pares")
print("Suma:",suma_pares)
