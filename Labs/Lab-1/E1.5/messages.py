#encoding: UTF-8
from follow import followingquiet
"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis()

def sendMessage(uemail, message):
    conn.rpush("Messages:" + uemail, message)
    print("Message sent")
    print()

def listMyMessages(uemail):
    counter = 1
    print("List of my messages: ")
    for i in conn.lrange("Messages:" + uemail, 0, -1):
        print("Message " + str(counter) + "\t" +  str(i, "utf-8"))
        counter += 1
    print()

def listMessageSubs(uemail):
    print("Messages from people I follow: ")
    lista = followingquiet(uemail)
    if len(lista) <= 0:
        return "No messages - Following 0 persons"
    for i in lista:
        for f in conn.lrange("Messages:" + i, 0, -1):
            print("Message from: " + i + "\t\t" + str(f, "utf-8"))
    print()