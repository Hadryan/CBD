#encoding: UTF-8

"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis()

def regist(email, password, name, age):
    if conn.get(email) is not None:
        return "Already on db"
    else:
        conn.set(email, password)
        conn.hset(f"UserList:{email}", "name", name)
        return "Success"