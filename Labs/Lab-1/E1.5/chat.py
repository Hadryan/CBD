#encoding: UTF-8

from register import regist
from login import logIn
from follow import getForFollow, follow, following, unfollow

Menu = "2 - Login\n\
1 - Registar\n\
0 - Exit"

intMenu = "5- Send messages\n\
4 - List messages\n\
3 - Remover pessoas que sigo\n\
2 - Pessoas que sigo\n\
1 - Seguir pessoas\n\
0 - Exit"

def menu(inp):
    if (inp == "0"): exit()
    if (inp == "1"):
        email = input("User email: ")
        password = input("User password: ")
        name = input("Name: ")
        print(regist(email, password, name))
        return True
    if (inp == "2"):
        global uemail
        email = input("User email: ")
        password = input("User password: ")
        ret = logIn(email, password)
        if ( ret == "Success"): 
            uemail = email
            return False
        else: 
            print(ret)
            return True

def internalMenu(opt):
    if(opt == "0"): exit()
    if(opt == "1"):
        retList = getForFollow(uemail)
        if len(retList) <= 0:
            print("You have no persons to follow")
            return False
        email = input("Email to follow: ")
        print(follow(uemail, email, retList))
        print()
    if(opt == "2"):
        following(uemail)
    if(opt=="3"):
        ret = following(uemail)
        email = input("Email to unfollow: ")
        print(unfollow(uemail, email, ret))
        print()
    if(opt=="4"):
        print("Not available yet")
    if(opt=="5"):
        print("Not available yet")


print(Menu)
inp = input("Select an option: ")
while True:
    if (menu(inp) == False):
        break
    print(Menu)
    inp = input("Select an option: ")

while True:
    print(intMenu)
    opt = input("Select an option: ")
    internalMenu(opt)



