nombre = "Pepe"
ape1 = "Sala"
ape2 = "Grande"

dia = "03"
mes = "03"
anyo = "2001"


print("Nombre:",nombre)
print("Ape1:",ape1)
print("Ape2:",ape2)
print("Nombre completo:")
cadNomAp = nombre +' '+ ape1 +' '+ ape2
print(cadNomAp)
print("Longitud de la cadena Nombre:",len(cadNomAp))

print("Generando cadena fecha nacimiento...")
cadFecha = dia +'/' + mes +'/'+ anyo
print(cadFecha)

print("Concatenando cadena nombre y cadena fecha nacimiento...")
cadTotal = cadNomAp + "==>" + cadFecha
print(cadTotal)

