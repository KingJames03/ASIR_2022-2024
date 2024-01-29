input_inf = int(0)
input_sup = int(15)
print("Los numeros pares que hay entre 0 y 15 son")

if input_inf % 2 != 0:
    input_inf += 1

num = input_inf
cont = 0
while num <= input_sup:
    print(num)
    num += 2
    cont += 1

print("Desde 0 hasta 15 hay",cont,"pares")
