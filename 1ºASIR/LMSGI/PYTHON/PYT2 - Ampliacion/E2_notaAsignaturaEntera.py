input_nota = int(input("Introduzca su calificacion:"))

if(input_nota < 0):
    print("ERROR. Nota NEGATIVA")

elif(input_nota >= 0 and input_nota < 5):
    print("INSUFICIENTE.")

elif(input_nota == 5):
    print("SUFICIENTE")

elif(input_nota == 6):
    print("BIEN")

elif(input_nota == 7 or input_nota == 8):
    print("NOTABLE")

elif(input_nota == 9 or input_nota == 10):
    print("SOBRESALIENTE")

else:
    print("ERROR: Supera el 10")