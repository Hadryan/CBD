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
      name = request.form['first_name']
      last = request.form['last_name']
      bio = request.form['biografia']
      return mongo.insertInfo(name, last, bio)
@app.route('/search')
def pesquisar():
    return jsonify(mongo.pesquisarInfo())

@app.route('/edit')
def editar():
    return render_template('formEdit.html')

@app.route('/editProcess', methods=['POST'])
def editarBio():
    if request.method == 'POST':
        name = request.form['first_name']
        bio = request.form['biografia']
        return mongo.updateBio(name, bio)

if __name__ == '__main__':
    app.run()