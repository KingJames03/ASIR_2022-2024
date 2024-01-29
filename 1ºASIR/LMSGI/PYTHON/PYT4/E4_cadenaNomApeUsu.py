nombre = str(input("Introduce tu nombre:"))
ape1 = str(input("Introduce tu primer apellido:"))
ape2 = str(input("Introduce tu segundo apellido"))

dia = str(input("Introduce el dia en que naciste"))
mes = str(input("Introduce el mes en el que naciste"))
anyo = str(input("Introduce el año en el que naciste"))


print("Nombre:",nombre)
print("Ape1:",ape1)
print("Ape2:",ape2)
print("Nombre completo:")
cadNomAp = nombre +''+ ape1 +''+ ape2
print(cadNomAp)
print("Longitud de la cadena Nombre:",len(cadNomAp))

print("Generando cadena fecha nacimiento...")
cadFecha = dia +'/' + mes +'/'+ anyo
print(cadFecha)

print("Concatenando cadena nombre y cadena fecha nacimiento...")
cadTotal = cadNomAp + "==>" + cadFecha
print(cadTotal)

