#encoding: UTF-8

"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis()

def getForFollow(uemail):
    for i in conn.keys("UserList:*"):
        if(str(i, "utf-8")[9:] != uemail):
            print(str(i, "utf-8")[9:])

def follow(uemail, email):
    if ( email == uemail):
        return "It's not possible follow yourself"
    else:
        conn.sadd(f"MyFollowList:{uemail}", email)
        return "Success"

def following(uemail):
    print("My Following List:")
    for i in conn.smembers("MyFollowList:" + uemail):
        print(str(i, "utf-8"))
    print()

def unfollow(uemail,email):
    try:
        conn.srem(f"MyFollowList:{uemail}", email)
        return "Success"
    except:
        return "Error"