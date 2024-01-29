input_notas = int(input("Cuantas notas desea solicitar"))
cond = (input_notas <= 15) #Condición para que las notas estén en rango de <=15

while cond == False: #Bucle para asegurar la condicion que las notas que pides estan en el rango
    print("Numero de notas esta fuera del rango")
    print("Tiene que ser: 0 <=",input_notas,"<= 15")
    input_notas = int(input("Introduzca otro numero de notas valido"))
    cond: bool = (input_notas <= 15)

print("Vamos a solicitar",input_notas,"notas")

i = int(0)

while i < input_notas:
    input_nota = float(input("Introduzca nota:"))
    cond2: bool = (input_nota >= 0 and input_nota <= 10) #Condicion para que la nota esté en el rango
    while cond2 == False: #Bucle para asegurarse que la nota esté en el rango especificado
        print("Nota fuera de rango:",input_nota)
        print("Tiene que cumplir: 0 <=",input_nota,"<=10")
        input_nota = float(input("Introduzca nota:"))
        cond2 = (input_nota >= 0 and input_nota <= 10)

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