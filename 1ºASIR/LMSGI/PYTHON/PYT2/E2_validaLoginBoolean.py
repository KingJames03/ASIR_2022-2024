print("Los valores buenos son: user= Pepe y password= Bueno")
login = str("Pepe")
password = str("Bueno")

input_user = str(input("Introduzca su userid:"))
input_password = str(input("Introduzca su password:"))

loginOK = (input_user==login)
passwordOK = (input_password==password)
allOK = (input_user==login and input_password==password)

if (loginOK == True):
    print("El login es CORRECTO")
else:
    print("Login: INCORRECTO")

if (passwordOK==True):
    print("El password es CORRECTO")
else:
    print("Password: INCORRECTO")

if (allOK == True):
    print("Tanto login como password son CORRECTOS")

elif (loginOK == False):
    print("Solamente es correcto el PASSWORD")

elif (passwordOK == False):
    print("Solamente es correcto el LOGIN")