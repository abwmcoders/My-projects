from flask import Flask, jsonify, request

app = Flask(__name__)



stores = [
    {
        "name" : "maliktech investments",
        "services" : [
            {"name" : "phorocopying service",
            "price" : 20
            }
        ]
    },
    {
        "name" : "maliktech store",
        "services" : [
            {"name" : "stationaries",
            "price" : 200
            }
        ]
    },
]



@app.route("/")
def home():
    return "hey berry"


@app.route("/store/<string:name>")
def get_store(name):
    for store in stores:
        if (store['name']==name):
            return jsonify(store['name'])

    return jsonify({'message' : 'Service not available'})   


@app.route("/store/<string:name>/services")
def get_store_services(name):
    for store in stores:
        if (store['name']==name):
            return jsonify(store['services'])

    return jsonify({'message' : 'Service not available'}) 

@app.route('/store', methods=['POST'])
def create_store():
    req_data = request.get_json()
    new_store = {
        'name' : req_data['name'],
        'services' : []
    }
    stores.append(new_store)
    return jsonify(new_store)


@app.route('/store/<string:name>/services', methods=['POST'])
def create_store_services(name):
    for store in stores:
        if(store['name']==name):
            req_data = request.get_json()
            new_service = {
                'name' : req_data['name'],
                'price' : req_data['price']
            }
            store['services'].append(new_service)
            return jsonify(new_service)
    return jsonify({'message' : 'store not find'})




app.run(port=1200)    