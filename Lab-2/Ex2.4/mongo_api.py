from pymongo import MongoClient
import json
from bson import json_util
import settings
import re

class MongoAPI():
    """
    Deals with the connection between
    between our app and the MongoDB.
    """

    def __init__(self):
        """
        Constructor.
        """
        self.client = MongoClient(settings.FULL_URL)
        self.cbd = self.client.CBD.rest

    def insertInfo(self, building, coord, rua, zipcode, localidade, gastronomia, date, grade, score, nome, restaurant_id):
        try:
            self.cbd.insert([{"address": [{"building": building, "coord": coord, "coord": coord, "rua":rua, "zipcode": zipcode}],
                               "localidade": localidade,
                               "gastronomia":gastronomia,
                               "grades":[{"date": date, "grade": grade, "score":score}],
                                "nome":nome,
                              "restaurant_id": restaurant_id
                               }])
        except:
            return "<p>Falha ao inserir <a href='/'>retornar à página principal</a><p>" 
        return "<p>Inserido com sucesso <a href='/'>retornar à página principal</a><p>"
    
    def pesquisarInfo(self):
        lista = []
        for i in self.cbd.find({}, {"_id":0}):
            lista.append(json.loads(json_util.dumps(i)))
        return lista
    
    def updateBio(self, building, coord, rua, zipcode, localidade, gastronomia, nome, restaurant_id):
        try:
            self.cbd.update({"restaurant_id": str(restaurant_id)}, {"$set": {"address": [{"building": building, "coord": coord, "coord": coord, "rua":rua, "zipcode": zipcode}],
                               "localidade": localidade,
                               "gastronomia":gastronomia,
                               "nome": nome
                               }})
        except:
            return "<p>Falha ao atualizar <a href='/'>retornar à página principal</a><p>"
        return "<p>Atualizado com sucesso <a href='/'>retornar à página principal</a><p>"

    def getInfo(self, rest):
        lista = []
        for i in self.cbd.find({"nome":rest}):
            del i['_id']
            lista.append(json.loads(json_util.dumps(i)))
        return lista

    def getCountLocalidades(self):
        return len(self.cbd.distinct('localidade'))

    def getRestaurantesLocalidade(self):
        lista = []
        lista.append(json.loads(json_util.dumps(self.cbd.aggregate([{"$group" : {"_id":"$localidade", "count_1":{"$sum":1}}}]))))
        return lista

    def getGatronomiaLocalidade(self):
        lista = []
        lista.append(json.loads(json_util.dumps(
            self.cbd.aggregate([{"$group" : {"_id":{"gastronomia":"$gastronomia", "localidade":"$localidade"}, "count":{"$sum":1}}}]
                               ))))
        return lista

    def getRestWithNameCloserTo(self, name):
        lista = []
        rgx = '.*' + name + '.*'

        regx = re.compile(rgx, re.IGNORECASE)

        for i in self.cbd.find({"nome": regx }, {"nome":"*"}):
            lista.append(json.loads(json_util.dumps(i)))
        return lista
    def genIndex(self):
        self.cbd.ensure_index({"gastronomia":1})
        self.cbd.ensure_index({"localidade":1})
        self.cbd.ensure_index({"nome":1})
        return "<p>Índices criados com sucesso <a href='/'>retornar à página principal</a><p>"
