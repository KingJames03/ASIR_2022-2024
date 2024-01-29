cadTotal = str("Pepe Sala Grande ==> 12/10/2000")
print("Datos Entrada:",cadTotal)
primerBlanco = cadTotal.find(" ",1,len(cadTotal))

print("Primer blanco se encuentra en pos",primerBlanco)

segundoBlanco = cadTotal.find(" ",primerBlanco+1,len(cadTotal))

print("Segundo blanco se encuentra en pos",segundoBlanco)
ape2 = (cadTotal[primerBlanco:segundoBlanco])

primerIgual = cadTotal.find("=",1,len(cadTotal))
print("Primer igual se encuentra en pos:",primerIgual)

primerSlash = cadTotal.find("/",1,len(cadTotal))
print("Primer slash se encuentra en pos:",primerSlash)

segundoSlash = cadTotal.find("/",primerSlash+1,len(cadTotal))
print("Segundo slash se encuentra en pos:",segundoSlash)

nombre = (cadTotal[:primerBlanco])
print("Nombre:",nombre)

ape1 = (cadTotal[primerBlanco:segundoBlanco])
print("Apellido1:",ape1)

ape2 = (cadTotal[segundoBlanco:primerIgual])
print("Apellido2:",ape2)

primerMayor = cadTotal.find(">",1,len(cadTotal))

dia = (cadTotal[primerMayor+1:primerSlash])
print("Dia:", dia)

mes = (cadTotal[primerSlash+1:segundoSlash])
print("Mes:", mes)

anyo = (cadTotal[segundoSlash+1:])
print("Año:", anyo)





