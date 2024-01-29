x = int(input("Introduzca valor del radio:"))
radio = float()
pi = float(3.1416)
if (x > 0):
    radio = 2*pi*x
    print("La longitud de la circunferencia es:",radio)
else:
    print("El radio es negativo. Error")