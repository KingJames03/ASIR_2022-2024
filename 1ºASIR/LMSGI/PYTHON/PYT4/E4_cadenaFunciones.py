cadTotal = str("Pepe Sala Grande ==> 12/10/2000")

print("Cadena original")
print(cadTotal)

mayus = (cadTotal.capitalize())
#Visualiza la cadena con su primera letra en mayúscula
print("Primera mayúscula:")
print(mayus)

#Rellena la cadena por ambos extremos con carácter asterisco, hasta llegar a una longitud de 60 caracteres
print("Rellenar con 60 *:")
print(cadTotal.center(60,'*'))

#Visualiza la primera posición en la que encuentra la letra a. La búsqueda la hace desde el inicio de la cadena
print("Primera posicion de la letra a:")
print(cadTotal.find("a",1,len(cadTotal)))

#Visualiza la primera posición en la que encuentra la letra a. La búsqueda la hace desde la posición del primer carácter blanco
print("Posicion primera letra a despues del primer blanco:")
primerBlanco = cadTotal.find(" ",1,len(cadTotal))
letra_dsps_blanco = cadTotal.find("a",primerBlanco,len(cadTotal))
print(letra_dsps_blanco)

#Visualiza sólo el nombre, no los apellidos. Lo hace en minúsculas
print("Nombre en minusculas:")
nombre = (cadTotal[:primerBlanco])
print(nombre.lower())

#Visualiza sólo el segundo apellido. Lo hace en mayúsculas
print("Segundo apellido en mayusculas:")
segundoBlanco = cadTotal.find(" ",primerBlanco+1,len(cadTotal))
primerIgual = cadTotal.find("=",1,len(cadTotal))
ape2 = (cadTotal[segundoBlanco:primerIgual])
print(ape2.upper())

#Visualiza sólo el nombre, no los apellidos y rellena con blancos hasta una longitud de 20
print("Nombre con 20 espacios")
nombre = (cadTotal[:primerBlanco])
nombre_temp = nombre.center(20," ")
print(nombre_temp)

#Omite los blancos generados en el caso anterior
print("Nombre limpio")
nombre_limpio = nombre_temp.strip()
print(nombre_limpio)


