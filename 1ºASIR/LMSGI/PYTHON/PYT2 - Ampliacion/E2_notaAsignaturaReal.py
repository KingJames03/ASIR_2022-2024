input_nota = float(input("Introduzca su calificacion:"))

if(input_nota < 0):
    print("ERROR. Nota NEGATIVA")

elif(input_nota >= 0 and input_nota < 5.0):
    print("INSUFICIENTE.")

elif(input_nota >= 5.0 and input_nota <= 5.9):
    print("SUFICIENTE")

elif(input_nota >= 6.0 and input_nota <= 6.9):
    print("BIEN")

elif(input_nota >= 7.0 and input_nota <= 8.9):
    print("NOTABLE")

elif(input_nota >= 9.0 and input_nota <= 10.0):
    print("SOBRESALIENTE")

else:
    print("ERROR: Supera el 10")