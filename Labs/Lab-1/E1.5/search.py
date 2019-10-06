#encoding: UTF-8    
import redis
from follow import following, followingquiet
conn = redis.Redis()

"""
Given an email follwed by
the user presents the
messages for that email.

Note: User can only see 
messages from users we follow.

Paramaters
-----
uemail - User email

Returns
-----
True if we get the messeges from
the email, otherwise false.
"""
def searchByEmail(uemail):
    lista = following(uemail)
    if len(lista) <= 0:
        print("You're following 0 persons")
        print()
        return False
    email = input("Email to search: ")
    if email not in lista:
        print("You're not following this person")
        print()
        return False
    else:
        for i in conn.lrange("Messages:" + email, 0, -1):
            print("Message from: " + email + "\t\t" + str(i, "utf-8"))
        print()
        return True
"""
Display all messages containing
a statment introduced by the user.

Note: the search should note be case
sensitive -> user upper() function
in both side of the conditions.

Parameters
-----
uemail - User email

Returns
-----
True if we get messages otherwise
false.

Note: get messages can mean empty
return queries.
"""
def searchByContent(uemail):
    lista = followingquiet(uemail)
    if len(lista) <= 0:
        print("No messages - Following 0 persons")
        print()
        return False
    content = input("Message to search: ")
    for i in lista:
        for f in conn.lrange("Messages:" + i, 0, -1):
            if content.upper() in str(f, "utf-8").upper():
                print("Message from: " + i + "\t\t" + str(f, "utf-8"))
    print()
    return True
"""
Get all users into the
database.

Returns
-----
lista - List of all users
"""
def getallUsers():
    lista = []
    for i in conn.keys("UserList:*" ):
        lista.append(str(i, "utf-8")[9:])
    return lista

"""
Gets the followers of the 
system user.

Parameters
-----
uemail - User email
"""
def searchMyFollowers(uemail):
    allUsers = getallUsers() 
    flag = False
    for i in allUsers:
        for f in conn.smembers("MyFollowList:" + i):
            if str(f, "utf-8") == uemail:
                if not flag:
                    print("Followed by: ")
                    print(i)
                    flag = True
                else:
                    print(i)
    print()