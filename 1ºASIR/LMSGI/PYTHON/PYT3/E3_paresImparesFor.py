input_inicio = int(1)
input_fin = int(21)

#PARES
cont = 0
print("PARES: Desde 1 hasta 20:")
for num in range (input_inicio, input_fin):
    if num % 2 == 0: #Validar que sea PAR
        print(num)
        cont = cont + 1
print("Total Pares:",cont)

#IMPARES
cont = 0
print("IMPARES: Desde 1 hasta 20:")
for num in range (input_inicio, input_fin):
    if num % 2 == 1: #Validar que sea IMPAR
        print(num)
        cont = cont + 1
print("Total Impares:",cont)



