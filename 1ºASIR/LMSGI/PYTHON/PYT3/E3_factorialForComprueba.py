
num = int(input("Introduzca valor positivo y menor que 12: "))

factorial = 1

if num > 0 and num < 12:
   print("El valor",num,"esta en el rango correcto")
   for i in range (1, num + 1):
      factorial = factorial*i
   print("El factorial de",num,"es",factorial)

elif num > 0 and num > 12:
   print("Error. Se supera tope Superior. Máximo es: 11")

else:
   print("Error. Valor negativo")

