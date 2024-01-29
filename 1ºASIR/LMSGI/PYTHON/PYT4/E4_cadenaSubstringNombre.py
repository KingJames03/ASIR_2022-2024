cadTotal = str("Pepe Sala Grande ==> 12/10/2000")
print("Datos Entrada:",cadTotal)
primerBlanco = cadTotal.find(" ",1,len(cadTotal))

print("Primer blanco se encuentra en pos",primerBlanco)

segundoBlanco = cadTotal.find(" ",primerBlanco+1,len(cadTotal))

print("Segundo blanco se encuentra en pos",segundoBlanco)
subcad = (cadTotal[primerBlanco:segundoBlanco])
print("Subcadena con apellido es:",subcad)



