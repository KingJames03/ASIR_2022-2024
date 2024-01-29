x = int(input("Introduzca un numero:"))

if (x > 0):
    print(x,"es un numero positivo")
    input("Pulse INTRO para finalizar...")
elif (x < 0):
    print(x,"es un numero negativo")
    input("Pulse INTRO para finalizar...")
else:
    print(x,"No pertenece a ningun grupo")
    input("Pulse INTRO para finalizar...")