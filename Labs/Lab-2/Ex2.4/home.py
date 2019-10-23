class Home():
    """
    Allow us to generate API Main Page.
    """
    def home(self):
        paths = [
            {
                'titulo': 'Inserção',
                'definicao': 'Inserir uma pessoa pelo seu primeiro e último nome.',
                'link': '/insert',
                'argumento': "None"
            },
            {
                'titulo': 'Pesquisa',
                'definicao': 'Pesquisar todas as pessoas existentes na base de dados.',
                'link': '/search',
                'argumento': "None"
            },
            {
                'titulo': 'Atualizar',
                'definicao': 'Atualizar biografia de uma pessoa',
                'link': '/edit/<nome>',
                'argumento': "Nome do restaurante"
            },
            {
                'titulo': 'Localidades',
                'definicao': 'Ver número de localidades distintas',
                'link': '/localidades/distintas',
                'argumento': "None"
            },
        ]
        return paths