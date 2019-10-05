#encoding: UTF-8

"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis()

"""
Allow us to check if 
the password and email
given by user matches 
the info into the redis
database.
"""
def logIn(email, password):
    try:
        if str(conn.get(email), "utf-8") == password:
            return "Success"
        else:
            return "Invalid Credentials"
    except:
        return "Invalid Credentials"