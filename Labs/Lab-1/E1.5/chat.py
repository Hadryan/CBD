#encoding: UTF-8

from register import regist
from login import logIn
from follow import getForFollow, follow, following, unfollow
from messages import sendMessage, listMyMessages, listMessageSubs

Menu = "2 - Login\n\
1 - Registar\n\
0 - Exit"

intMenu = "6 - List messages from persons I follow\n\
5 - List my messages\n\
4 - Send messages\n\
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
        print()
        if len(retList) <= 0:
            print("You have no persons to follow")
            print()
            return False
        email = input("Email to follow: ")
        print(follow(uemail, email, retList))
        print()
    if(opt == "2"): following(uemail)
    if(opt=="3"):
        ret = following(uemail)
        email = input("Email to unfollow: ")
        print(unfollow(uemail, email, ret))
        print()
    if(opt=="4"):
        message = input("Message: ")
        sendMessage(uemail, message)
    if(opt=="5"): listMyMessages(uemail)
    if(opt=="6"): listMessageSubs(uemail)


print(Menu)
inp = input("Select an option: ")
while True:
    if (menu(inp) == False):
        print()
        break
    print(Menu)
    inp = input("Select an option: ")

while True:
    print(intMenu)
    opt = input("Select an option: ")
    internalMenu(opt)