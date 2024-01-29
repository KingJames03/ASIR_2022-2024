input_notas = int(input("Cuantas notas desea convertir"))
print("Vamos a convertir",input_notas,"notas")

i = int(0)

while i < input_notas:
    input_nota = float(input("Introduzca nota:"))

    if input_nota >= 0 and input_nota < 5:
        print("Calificacion obtenida: Suspenso")
    elif input_nota >= 5 and input_nota < 6:
        print("Calificacion obtenida: Suficiente")
    elif input_nota >= 6 and input_nota < 7:
        print("Calificacion obtenida: Bien")
    elif input_nota >= 7 and input_nota < 8.5:
        print("Calificacion obtenida: Notable")
    elif input_nota >= 8.5 and input_nota < 10:
        print("Calificacion obtenida: Sobresaliente")
    elif input_nota >= 10:
        print("Calificacion obtenida: Matricula de Honor")
    else:
        print("Número de notas no puede ser negativo")
    i += 1