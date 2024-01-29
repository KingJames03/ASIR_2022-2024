print("Los valores buenos son: user= Pepe y password= Bueno")
login = str("Pepe")
password = str("Bueno")

input_user = str(input("Introduzca su userid:"))
input_password = str()

loginOK = (input_user==login)


if (loginOK == True):
    print("El login es CORRECTO")
    input_password = input("Introduzca su password:")
    passwordOK = (input_password == password)

    if (passwordOK == True):
        print("El password tambien es CORRECTO")
        print("Entramos en el sistema...")

    else:
        print("Password INCORRECTO")
        print("ACCESO DENEGADO!")

else:
    print("Login: INCORRECTO")
    print("BYE BYE")

