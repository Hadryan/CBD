#encoding: UTF-8

"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis
conn = redis.Redis() #Establish connection with Redis Database

conn.flushdb()

"""
Data to be inserted and proper
sort. That will allow us to 
push (rigth) into Redis and
having the information ordered.
"""
data = ["Emanuel", "Joaquim", "Paulo"]
data.sort()

for i in data:
	conn.rpush("listOfUsers", i)

db_table = conn.lrange("listOfUsers", 0, -1)

for name in db_table:
	print(str(name, "utf-8")) 
