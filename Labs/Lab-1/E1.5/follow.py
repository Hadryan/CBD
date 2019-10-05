#encoding: UTF-8

"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis()

"""
Get possible list of users
to follow given the user email.

Parameters
-----
uemail - User email

Returns
-----
retList - List of emails available 
          to follow
"""
def getForFollow(uemail):
    lfollowing = []
    retList = []
    print("Emails to follow: ")
    for i in conn.smembers("MyFollowList:" + uemail):
        lfollowing.append(str(i, "utf-8"))
    for i in conn.keys("UserList:*"):
        if(str(i, "utf-8")[9:] != uemail):
            if str(i, "utf-8")[9:] not in lfollowing:
                retList.append(str(i, "utf-8")[9:])
                print(str(i, "utf-8")[9:])
    return retList

"""
Allow users to follow other
users.
Note: The user can't follow 
himself or generate new users.

Parameters
-----
uemail - User email
email - Email to add
retList - List of possible 
        emails to add

Returns
-----
Success if the insert is successfull 
otherwise an error message.
"""
def follow(uemail, email, retList):
    if ( email == uemail):
        return "It's not possible follow yourself"
    else:
        if email not in retList:
            return "Unable to add person to follow"
        else:
            conn.sadd(f"MyFollowList:{uemail}", email)
            return "Success"

"""
Given an users gets the emails
he follows.

Parameters
-----
uemail - User email

Returns
-----
lfollowing - Following list
"""
def following(uemail):
    lfollowing = []
    print("My Following List:")
    for i in conn.smembers("MyFollowList:" + uemail):
        print(str(i, "utf-8"))
        lfollowing.append(str(i, "utf-8"))
    print()
    return lfollowing

"""
Allow users to unfollow users.

Parameters
-----
uemail - User email
email - Email to unfollow
retList - List of all emails 
        that user can unfollow

Returns
-----
Success if we unfollow the user
otherwise an error message.
"""
def unfollow(uemail,email, retList):
    if email not in retList:
        return email + "it's not into your following list"
    else:
        conn.srem(f"MyFollowList:{uemail}", email)
        return "Success"


"""
Given an users gets the emails
he follows.
Remove all prints

Parameters
-----
uemail - User email

Returns
-----
lfollowing - Following list
"""
def followingquiet(uemail):
    lfollowing = []
    for i in conn.smembers("MyFollowList:" + uemail):
        lfollowing.append(str(i, "utf-8"))
    return lfollowing
