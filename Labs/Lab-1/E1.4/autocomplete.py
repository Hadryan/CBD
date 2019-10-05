#encoding: UTF-8
"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

"""
ALlow us to search the user
input and check if the 
value is on our database.

An autocompleter should not
be case senstive so we should
make this a requisite. To 
aim this we upper the user 
input and the result of the 
queries.
"""
def autoComplete(inp):
	search = conn.zrange("autocomplete", 0, -1)
	for k in search:
		if str(k, "utf-8").upper().startswith(inp):
			print(str(k, "utf-8"))
	print()

if __name__ == "__main__":
	conn = redis.Redis()
	inp = input("Search for ('Enter' for quit): ").upper()
	while inp != "":
		autoComplete(inp)
		inp = input("Search for ('Enter' for quit): ").upper()