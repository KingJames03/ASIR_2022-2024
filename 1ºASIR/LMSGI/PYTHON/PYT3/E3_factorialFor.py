
num = int(input("Vamos a calcular el factorial de: "))

factorial = 1 #No se puede inicializar a 0, ya que al multiplicar por 0 da 0
for i in range (1, num + 1): #Empieza en uno y llega hasta el num el bucle
   factorial = factorial*i #Almacena las multiplicaciones

print("El factorial de (!",num,") es",factorial)

