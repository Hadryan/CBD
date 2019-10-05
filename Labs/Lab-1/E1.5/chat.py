#encoding: UTF-8

from register import regist
from login import logIn
from follow import getForFollow, follow, following, unfollow

def menu(inp):
    if (inp == "0"):
        exit()
    if (inp == "1"):
        email = input("User email: ")
        password = input("User password: ")
        name = input("Name: ")
        age = input("Age: ")
        print(regist(email, password, name, age))
        return True
    if (inp == "2"):
        email = input("User email: ")
        password = input("User password: ")
        ret = logIn(email, password)
        if ( ret == "Success"): 
            global uemail
            uemail = email
            return False
        else: 
            print(ret)
            return True

def internalMenu(opt):
    if(opt == "0"): exit()
    if(opt == "1"):
        getForFollow(uemail)
        email = input("Email to follow: ")
        print(follow(uemail, email))
        print()
    if(opt == "2"):
        following(uemail)
    if(opt=="3"):
        following(uemail)
        email = input("Email to unfollow: ")
        print(unfollow(uemail, email))
        print()
    if(opt=="4"):
        print("Not available yet")
    if(opt=="5"):
        print("Not available yet")

pmenu = "2 - Login\n1 - Registar\n0 - Exit"
print(pmenu)
inp = input("Select an option: ")
while True:
    if (menu(inp) == False):
        break
    print(pmenu)
    inp = input("Select an option: ")

pmenu = "5- Send messages\n\
4 - List messages\n\
3 - Remover pessoas que sigo\n\
2 - Pessoas que sigo\n\
1 - Seguir pessoas\n\
0 - Exit"
while True:
    print(pmenu)
    opt = input("Select an option: ")
    internalMenu(opt)



