print("Los valores de corte son Ram= 1024 Mb y Veloc. procesador= 1000 Mhz")
mega = int(1000)
ram = int(1024)
input_mega = int(input("Cantidad de Megahertz tiene su procesador:"))
input_ram = int(input("Cantidad de memoria RAM (Mbytes):"))


if (input_mega > mega):
    print("La velocidad del procesador cumple")
else:
    print("Tu procesador no cumple con los requisitos")

if (input_ram >= ram):
    print("Tienes suficiente RAM")
    input('Pulse INTRO para finalizar...')
else:
    print("No tienes suficiente memoria RAM")
    input('Pulse INTRO para finalizar...')

if (input_mega < mega and input_ram < ram):
    print("Tu procesador no cumple los requisitos")
    print("No tienes suficiente RAM")
    input('Pulse INTRO para finalizar...')