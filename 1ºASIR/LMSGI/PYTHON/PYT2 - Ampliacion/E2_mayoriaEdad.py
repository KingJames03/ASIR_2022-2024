
input_edad = int(input("Cuantos anyos tienes:"))

if (input_edad >= 18):
    print("Eres MAYOR de edad.")

elif(input_edad > 0 and input_edad < 17):
    print("Eres MENOR de edad.")

else:
    print("Error. No puedes tener edad NEGATIVA")


