#encoding: UTF-8

"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis()

"""
Allow us to store users into 
our database.
For an easy login we set the email
and password but first we verify
if the email is already into 
the database.
"""
def regist(email, password, name):
    if conn.get(email) is not None:
        return "Already on db"
    else:
        conn.set(email, password)
        conn.hset(f"UserList:{email}", "name", name)
        return "Success"