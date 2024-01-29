print("Los valores buenos son: user= Pepe y password= Bueno")
login = str("Pepe")
password = str("Bueno")

input_user = str(input("Introduzca su userid:"))
input_password = str(input("Introduzca su password:"))

if (input_user == login and input_password == password):
    print("El login es CORRECTO")
    print("El password es CORRECTO")
    print("Tanto login como password son CORRECTOS")

elif (input_user != login and input_password == password):
    print("Login: INCORRECTO")
    print("El password es CORRECTO")
    print("Solamente es correcto el PASSWORD")

elif (input_user == login and input_password != password):
    print("El login es CORRECTO")
    print("Password: INCORRECTO")
    print("Solamente es correcto el LOGIN")
