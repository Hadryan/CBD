#encoding: UTF-8

import argparse
"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

"""
Allow us to insert information into
the redis database.
Open the file, read line by line
and add the line to the database.
For this case the value is completely 
meaningless so we just define it 
as 0.
"""
def insertData():
	f = open('female-names.txt',"r")
	for line in f:
		conn.zadd('autocomplete', {line.strip():0})

if __name__ == "__main__":
	conn = redis.Redis()
	parser = argparse.ArgumentParser()
	parser.add_argument("--f", help="Clean database. 0 - Disable, 1 - Enable", default="0")
	args = parser.parse_args()
	FLUSH = args.f
	if (FLUSH == "1"): conn.flushdb()
	insertData()