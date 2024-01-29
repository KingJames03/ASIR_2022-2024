
cont = 0
print("Los numeros pares que hay entre 1 y 15 son")
for num in range (1, 16):
    if num % 2 == 0:
        print(num)
        cont = cont + 1



print("Desde 1 hasta 15 hay:",cont,"PARES")