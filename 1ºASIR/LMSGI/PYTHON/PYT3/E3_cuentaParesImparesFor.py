input_inicio = int(1) #Variables prestablecidas que se pueden cambiar
input_fin = int(21) #Variables prestablecidas que se pueden cambiar

#PARES
cont = 0 #Inicializada a 0 la variable para que empiece a contar
print("Desde 1 hasta 20 hay :")
for num in range (input_inicio, input_fin):
    if num % 2 == 0: #Validar que sea PAR
        cont = cont + 1
print("Pares:",cont)

#IMPARES
cont = 0 #Reset de la variable contador
for num in range (input_inicio, input_fin):
    if num % 2 == 1: #Validar que sea IMPAR
        cont = cont + 1
print("Impares:",cont)



