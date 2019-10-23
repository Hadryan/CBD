from pymongo import MongoClient
import json
from bson import json_util
import settings


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
        self.cbd = self.client.EX24.teste
    
    def insertInfo(self, name, last, bio):
        try:
            self.cbd.insert([{"firstName": name, "lastName": last, "bio": bio}])
        except:
            return "<p>Falha ao inserir <a href='/'>retornar à página principal</a><p>" 
        return "<p>Inserido com sucesso <a href='/'>retornar à página principal</a><p>"
    
    def pesquisarInfo(self):
        lista = []
        for i in self.cbd.find({}, {"_id":0}):
            lista.append(json.loads(json_util.dumps(i)))
        return lista
    
    def updateBio(self, name, bio):
        try:
            self.cbd.update({"firstName": name}, {"$set": {"bio": bio}})
        except:
            return "<p>Falha ao atualizar <a href='/'>retornar à página principal</a><p>"
        return "<p>Atualizado com sucesso <a href='/'>retornar à página principal</a><p>"
