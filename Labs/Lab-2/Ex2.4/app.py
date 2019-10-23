from flask import Flask, jsonify, render_template, request
import mongo_api
import home

app = Flask(__name__)
mongo = mongo_api.MongoAPI()


@app.route('/')
@app.route('/home')
def main():
    paths = home.Home().home()
    return render_template('home.html', paths=paths)

@app.route('/insert')
def insert():
    return render_template('form.html')

@app.route('/insertProcess', methods=['POST'])
def insert_document():
    if request.method == 'POST':
        building = request.form['building']
        coord = request.form['coord']
        rua = request.form['rua']
        zipcode = request.form['zipcode']
        localidade = request.form['localidade']
        gastronomia = request.form['gastronomia']
        date = request.form['date']
        grade = request.form['grade']
        score = request.form['score']
        nome = request.form['nome']
        restaurant_id = request.form['restaurant_id']
    return mongo.insertInfo(building, coord, rua, zipcode, localidade, gastronomia, date, grade, score, nome, restaurant_id)
@app.route('/search')
def pesquisar():
    return jsonify(mongo.pesquisarInfo())

@app.route('/edit/<rest>')
def editar(rest):
    updates = mongo.getInfo(rest)
    return render_template('formEdit.html', paths=updates)

@app.route('/editProcess', methods=['POST'])
def editarBio():
    if request.method == 'POST':
        building = request.form['building']
        coord = request.form['coord']
        rua = request.form['rua']
        zipcode = request.form['zipcode']
        localidade = request.form['localidade']
        gastronomia = request.form['gastronomia']
        nome = request.form['nome']
        restaurant_id = request.form['restaurant_id']
        return mongo.updateBio(building, coord, rua, zipcode, localidade, gastronomia, nome, restaurant_id)

if __name__ == '__main__':
    app.run()