#encoding: UTF-8

import argparse
"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis() #Establish connection with Redis Database
def insertData():
	"""
	Data to be inserted and proper
	sort. That will allow us to 
	push (right) into Redis and
	having the information ordered.
	"""
	data = ["Ana", "Pedro", "Maria", "Luís"]
	data.sort()

	"""
	Inserts all data using right push.
	"""
	for i in data:
		conn.rpush("listOfUsers", i)

def ifEnabled():
	# Gets the list of user (list range)
	db_table = conn.lrange("listOfUsers", 0, -1)
	"""
	Allow us to print the info we want.
	"""
	for name in db_table:
		print(str(name, "utf-8"))

if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument("--p", help="Enable printing the result of the insertion query. 0 - Disable, 1 - Enable", default="1")
	parser.add_argument("--f", help="Clean database. 0 - Disable, 1 - Enable", default="0")
	args = parser.parse_args()
	ENABLE = args.p
	FLUSH = args.f
	if (FLUSH == "1"):
		conn.flushdb()
	insertData()
	if (ENABLE == "1"):
		ifEnabled()
