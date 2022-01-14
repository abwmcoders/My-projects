import json

items = json.loads('[{"id": 1, "text": "Malik"}, {"id": 2, "text": "berry"}]')

for item in items:
    print(item['id'])

item1 = "my-name";
item2 = "your name";

result = item1 == item2
def do_something(result):
  if result is True:
    print(1)
  else:
    print(5)
